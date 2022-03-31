# Usage: ruby mfa_output.rb <code from device>
# with the ARN of your MFA device available at $AWS_MFA_ARN

require "json"

mfa_output = `aws sts get-session-token --serial-number #{ENV.fetch("AWS_MFA_ARN")} --token-code #{ARGV[0]}`

credentials_file_location = "#{ENV.fetch("HOME")}/.aws/credentials"

new_credentials = JSON.parse(mfa_output)["Credentials"]

current_credentials_content = File.read(credentials_file_location)

if current_credentials_content =~ /\[mfa\]/
  # Remove old [mfa] section first
  current_credentials_content.gsub!(/\s?\[mfa\]([^\[]*)/m, "")
end

# Append new [mfa] section
current_credentials_content << <<-STRING

[mfa]
aws_access_key_id = #{new_credentials["AccessKeyId"]}
aws_secret_access_key = #{new_credentials["SecretAccessKey"]}
aws_session_token = #{new_credentials["SessionToken"]}
STRING

File.write(credentials_file_location, current_credentials_content)

puts "Credentials valid until #{new_credentials["Expiration"]}"
puts "Use `--profile mfa` with all aws-cli commands"

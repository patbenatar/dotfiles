SKIP_FILES = ["Rakefile"]

task :install do
  Dir.foreach(".") do |file|
    next if SKIP_FILES.include?(file) || file.start_with?(".")
    file_with_path = File.expand_path(file)
    `ln -s -f #{file_with_path} ~/.#{file}`
  end
end
SKIP_FILES = [".", "..", "Rakefile"]

task :install do
  Dir.foreach(".") do |file|
    next if SKIP_FILES.include?(file)
    file_with_path = File.expand_path File.new(file)
    `ln -s -f #{file_with_path} ~/tester/.#{file}`
  end
end
require "rake"
require "erb"

desc "Generators to help kickstart your project"
task :generate do
  template = ENV["template"] || "tvc"
  klass = ENV["klass"] || "YourClass"

  file = File.read("#{Dir.pwd}/tasks/templates/#{template}.erb")
  erb = ERB.new(file)
  puts erb.result(binding)
end

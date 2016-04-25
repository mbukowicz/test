require 'git'

task :test do
  g = Git.open('.')
  puts g.log.since('2 weeks ago')
end

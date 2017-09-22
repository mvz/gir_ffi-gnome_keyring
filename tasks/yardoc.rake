begin
  require 'yard'

  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['--private', '--protected', '--readme', 'README.md']
  end
rescue LoadError
end

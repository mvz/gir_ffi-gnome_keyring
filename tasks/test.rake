require 'rake/testtask'

namespace :test do

  Rake::TestTask.new(:unit) do |t|
    t.libs = ['lib']
    t.test_files = FileList['test/unit/**/*_test.rb']
    t.ruby_opts += ['-w -Itest']
  end

  Rake::TestTask.new(:integration) do |t|
    t.libs = ['lib']
    t.test_files = FileList['test/integration/*_test.rb']
    t.ruby_opts += ['-w -Itest']
  end
end

desc 'Run unit and integration tests'
task :test => ['test:unit', 'test:integration']

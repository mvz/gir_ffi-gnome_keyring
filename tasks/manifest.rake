# frozen_string_literal: true

require "rake/manifest/task"

Rake::Manifest::Task.new do |t|
  t.patterns = ["lib/**/*", "*.md", "COPYING.LIB"]
end

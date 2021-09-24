# frozen_string_literal: true

require "bundler/gem_helper"
require "rake/clean"

Bundler::GemHelper.install_tasks

load "tasks/test.rake"
load "tasks/manifest.rake"
load "tasks/yardoc.rake"

task default: "test"
task default: "manifest:check"
task build: "manifest:check"

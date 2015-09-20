require 'bundler/gem_helper'
require 'rake/clean'

Bundler::GemHelper.install_tasks

import 'tasks/test.rake'
import 'tasks/yardoc.rake'

task default: 'test'

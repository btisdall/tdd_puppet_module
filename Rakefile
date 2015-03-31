require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet/version'
require 'puppet/vendor/semantic/lib/semantic' unless Puppet.version.to_f < 3.6
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

# These gems aren't always present, for instance
# on Travis with --without development
begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError
end

Rake::Task[:lint].clear

exclude_paths = [
  "bundle/**/*",
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

disable_checks = [
  "class_inherits_from_params_class",
  "80chars",
  "autoloader_layout"
]

PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = exclude_paths
  config.disable_checks = disable_checks
  config.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
  config.with_context = true
  config.fail_on_warnings = true
end

PuppetSyntax.exclude_paths = exclude_paths

desc "Run acceptance tests"
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc "Populate CONTRIBUTORS file"
task :contributors do
  system("git log --format='%aN' | sort -u > CONTRIBUTORS")
end

task :metadata do
  sh "metadata-json-lint metadata.json"
end

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec,
  :metadata,
]

require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "sinatra_fake_webservice"
    gem.summary = %Q{use a sinatra application in your Rails test environment to fake a remote web service that needs more magic than Fakeweb}
    gem.description = %Q{FakeWeb allows you to fake a response from a specific url, this gem intends to give developers the option to allow several responses from the same url based on parameters (ex: WSDL)}
    gem.email = "elad@nautilus6.com"
    gem.homepage = "http://github.com/eladmeidar/sinatra_fake_webservice"
    gem.authors = ["Elad Meidar"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.add_dependency 'sinatra'
    
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sinatra_fake_webservice #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rubygems'
require 'test/unit'
require 'shoulda'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'metal'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra/base'

require 'sinatra_webservice'


class Test::Unit::TestCase
end

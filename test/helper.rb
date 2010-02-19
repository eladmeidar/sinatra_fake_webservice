require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'net/http'
require 'uri'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'metal'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra/base'
#require 'sinatra_ext'
require 'sinatra_webservice'
#require 'web_service'

class Test::Unit::TestCase
end

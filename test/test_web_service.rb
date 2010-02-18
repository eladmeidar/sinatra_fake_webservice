require 'helper'

class TestWebservice < Test::Unit::TestCase
  
  context "a new web service" do
    setup do
      @web_service = WebService.new
    end
    
    should "have a default name" do
      assert_equal "App", @web_service.name
    end
    
    should "have be set to localhost on port 4567" do
      assert_equal "localhost", @web_service.host
      assert_equal "4567", @web_service.port
    end
    
    context "with a custom method" do
      setup do
        @web_service = WebService.new
        @webservice.get "/test" do
          "Hiya!"
        end
        
        @webservice.run
      end
      
      should "respond to '/test' with 'Hiya!'" do
        res = Net::HTTP.start(@webservice.host,@webservice.port) do |http|
          http.get('/test')
        end
        puts res.body
        assert_equal "Hiya!", res.body
      end
    end
  end
  
end
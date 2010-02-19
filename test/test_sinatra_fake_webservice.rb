require 'helper'

class TestSinatraFakeWebservice < Test::Unit::TestCase
  
  context "a new sinatra web service" do
    
    setup do
      @sinatra_app = SinatraWebService.new
    end
    
    should "have default host and port" do
      assert_equal 4567, @sinatra_app.port
      assert_equal 'localhost', @sinatra_app.host
    end
    
    context "with a registered GET service" do
      
      setup do
        @sinatra_app.get '/payme' do
          "OMG I GOT PAID"
        end
        
        @sinatra_app.run!
      end
      
      should "respond to '/payme' with 'OMG I GOT PAID" do
        res = Net::HTTP.start(@sinatra_app.host, @sinatra_app.port) do |http|
          http.get('/payme')
        end

        assert_equal "OMG I GOT PAID",res.body
      end
    end
  end
end

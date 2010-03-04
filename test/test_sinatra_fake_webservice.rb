require 'helper'

class TestSinatraFakeWebservice < Test::Unit::TestCase
  
  context "a new sinatra web service" do
    
    setup do
      @sinatra_app = SinatraWebService.new
      @sinatra_app.run!
      
      @sinatra_app.get '/payme' do
        "OMG I GOT PAID"
      end
      
      @sinatra_app.post '/returnme' do
        "#{params[:return_value]}"
      end
       
      @sinatra_app.delete '/killme' do
        "argh! i is dead."
      end 
      
      @sinatra_app.put '/gimmieitnow' do
        "yay, i haz it."
      end
      
      #@sinatra_app.run!
    end
    
    should "have default host and port" do
      assert_equal 4567, @sinatra_app.port
      assert_equal 'localhost', @sinatra_app.host
    end
    
    context "with a registered GET service" do
      
      should "respond to GET '/payme' with 'OMG I GOT PAID" do
        res = @sinatra_app.get_response('/payme') 
        assert_equal "OMG I GOT PAID",res.body
      end
    end
    
    context "with a registered POST service" do
      
      should "respond to POST '/returnme' with param :return_value with param value" do
        res = @sinatra_app.post_response('/returnme',"return_value=2")
        
        assert_equal "2", res.body
      end
    end
    
    context "with a registered DELETE service" do
      
      should "respond to DELETE '/killme'" do
        res = @sinatra_app.delete_response('/killme')
        
        assert_equal "argh! i is dead.", res.body
      end
    end
    
    context "with a registered PUT service" do
      
      should "respond to put '/gimmieitnow'" do
        res = @sinatra_app.put_response('/gimmieitnow')
        
        assert_equal "yay, i haz it.", res.body
      end
    end
    
  end
end

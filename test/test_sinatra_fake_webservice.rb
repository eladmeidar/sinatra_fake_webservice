require 'helper'

class TestSinatraFakeWebservice < Test::Unit::TestCase
  
  context "a new sinatra web service" do
    
    setup do
      @sinatra_web_service = SinatraWebService.new
    end
    
    should "fails adding a new service explicitly" do
      assert_raises(TypeError) do
        @sinatra_web_service.services << WebService.new
      end
      assert @sinatra_web_service.services.empty?
    end
    
    should "fails assiging a new services array" do
      assert_raises(NoMethodError) do
        @sinatra_web_service.services = [WebService.new]
      end
      assert @sinatra_web_service.services.empty?
    end
    
    should "not be running by default" do
      @sinatra_web_service.add_service(WebService.new)
      assert !(@sinatra_web_service.running?)
    end
    
    should "run when !run is invoked" do
      @sinatra_web_service.add_service(WebService.new)
      @sinatra_web_service.run!
    end
    
    should "allow adding a new service with #add_service" do
      @sinatra_web_service.add_service(WebService.new)
      assert @sinatra_web_service.services.any?
    end 
    
    should "allow running all the sinatra subapplications" do
      @sinatra_web_service.add_service(WebService.new)
    end
  end
  
  
end

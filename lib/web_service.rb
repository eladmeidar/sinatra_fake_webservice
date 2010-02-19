require 'net/http'
class WebService
  
  class SinatraStem < Sinatra::Base      
    get '/' do
      "Hello! i am lindesy lohan!"
    end
  end
  
  attr_accessor :port, :host, :name, :sinatra_app
  
  
  # Initialize a new face service
  def initialize(options = {})
    @name = options[:name] ||= "App"
    @port = options[:port] ||= "4567"
    @host = options[:host] ||= "localhost"
    @sinatra_app = Sinatra::Base.new 
  end
  
  def proxy
    @sinatra_app
  end
  
  def run
    
    @port = find_free_port
    
    app = Thread.new("running_#{self.name}") do
      puts "\n == Starting webservice '#{@name}' on port #{@port}"
        proxy.run! :post => @host, :port => @port.to_i
      sleep 1
    end
  end
  
  def find_free_port
    found = false
    attempts = 0
    while !found and attempts < 10
      puts "\n== Trying port #{@port}"
      begin
        res = Net::HTTP.start(host,port) do |http|
          http.get('/')
        end
        attempts += 1
        @port = @port.succ
      rescue Errno::ECONNREFUSED
        return @port
      end
    end
  end
  
  def proxy
    @sinatra_app
  end
  
  def method_missing(method, *args, &block)
    proxy.send(method, *args, &block) unless method.to_s == "proxy"
  end
end
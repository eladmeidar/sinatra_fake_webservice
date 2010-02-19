

class SinatraWebService
  
  attr_accessor :host, :port
  
  class SinatraStem < Sinatra::Base      
    get '/' do
      "Hello! i am lindesy lohan!"
    end
  end
  
  
  def initialize(options = {})
    @host = options[:host] ||= 'localhost'
    @port = options[:port] ||= 4567
  end
  
  def running?
    false
  end

  def run!
    @port = find_free_port
    
    app = Thread.new("running_app") do
        SinatraStem.run! :post => @host, :port => @port.to_i
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
  
  def method_missing(method, *args, &block)
    SinatraStem.send(method, *args, &block) unless method.to_s == "proxy"
  end

end
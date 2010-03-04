require 'net/http'
require 'uri'

class SinatraWebService
  
  attr_accessor :host, :port
  attr_accessor :current_thread
  
  class SinatraStem < Sinatra::Base      
    
    enable :methodoverride
    
    get '/' do
      "Hello! i am lindesy lohan!"
    end
    
    post '/gimmie' do
      "here ya go"
    end
  end
  
  
  def initialize(options = {})
    @host = options[:host] ||= 'localhost'
    @port = options[:port] ||= 4567
  end
  
  def running?
    self.current_thread.alive? rescue false
  end

  def run!
    if Thread.list.size > 1
      Thread.list.first.kill
    end
    
    @port = find_free_port
    
    self.current_thread = Thread.new do
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
  
  def get_response(action)
    res = Net::HTTP.start(self.host, self.port) do |http|
      http.get(action)
    end
  end
  
  def delete_response(action, data = "", headers = nil, dest = nil)
    data = data.empty? ? "_method=delete" : data += "&_method=delete"
    post_response(action, data, headers, dest)
  end
  
  def put_response(action, data = "", headers = nil, dest = nil)
    data = data.empty? ? "_method=put" : data += "&_method=put"
    post_response(action, data, headers, dest)
  end
  
  def post_response(action, data, headers = nil, dest = nil)
    res = Net::HTTP.start(self.host, self.port) do |http|
      http.post(action, data, headers, dest)
    end
  end
  
  def method_missing(method, *args, &block)
    SinatraStem.instance_eval do |base|
      route method.to_s.upcase, *args, &block
    end 
  end

end
class WebService
  
  class App < Sinatra::Base
    get '/' do
      "Hello! i am lindesy lohan!"
    end
  end
  
  attr_accessor :port, :host, :name
  
  
  # Initialize a new face service
  def initialize(options = {})
    @name = options[:name] ||= "App"
    @port = options[:port] ||= "4567"
    @host = options[:host] ||= "localhost"
  end
  
  def run
    app = Thread.new("running_#{self.name}") do
      silence_stream(STDOUT) do
        App.run! :host => @host, :port => @port
      end
    end
    sleep 1
  end
  
  def method_missing(method, *args, &block)
    if App.respond_to?(method)
      App.send(method, args, block)
    else
      super
    end
  end
end
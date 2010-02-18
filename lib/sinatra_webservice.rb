

class SinatraWebService
  attr_reader :services

  def initialize
    
  end
  
  def running?
    false
  end
  
  def initialize
    @services = []
  end
  
  def services
    @services.dup.freeze
  end

  def run!
    @services.each do |service|
      puts "== Loading service #{service.name}"
      service.run
    end
  end
  
  def add_service(service = nil)
    raise "Tried to add an empty service" if service.nil?
    raise "Only WebService Objects are allowed" if !(service.is_a?(WebService))
    
    @services << service
  end

end
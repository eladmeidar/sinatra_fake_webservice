# Disabling the capture of the Errno::EADDRINUSE exception in #run! so we can make WebService catch it.
# class Sinatra::Base
#   def self.run!(options={})
#     attempts = 0
#     set options
#     handler = detect_rack_handler
#     handler_name = handler.name.gsub(/.*::/, '')
#     handler.run self, :Host => bind, :Port => port do |server|
#       trap(:INT) do
#         ## Use thins' hard #stop! if available, otherwise just #stop
#         server.respond_to?(:stop!) ? server.stop! : server.stop
#       end
#       set :running, true
#     end
#   end
# end

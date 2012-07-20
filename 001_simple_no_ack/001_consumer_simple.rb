$:.unshift File.dirname(__FILE__) + '/../../lib'
require 'amqp'
## require 'pp' ## What was this?
 
## Signal.trap('INT') { AMQP.stop{ EM.stop } } # Trapping this prevents Ctrl-C termination.
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  MQ.prefetch 1
  queue = MQ.queue 'jobs'
 
  queue.subscribe do |msg|
    # process this message
    sleep 0.2
    puts "consumer #{Process.pid} processed #{msg}"
  end

end

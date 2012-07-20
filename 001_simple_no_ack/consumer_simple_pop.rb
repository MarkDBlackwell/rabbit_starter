require 'amqp'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } } # Trapping this prevents Ctrl-C termination.
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  queue = MQ.queue 'jobs'
 
  queue.pop do |msg|
    # process this message
    if msg
      sleep 0.2
      puts "consumer #{Process.pid} processed #{msg}"
      queue.pop
    else
      puts "queue empty"
      EM.add_timer(1) { queue.pop }
    end
  end

end

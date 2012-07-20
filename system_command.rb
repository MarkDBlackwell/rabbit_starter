# Publishes any argument passed on the system queue

require 'amqp'

command =  $*
AMQP.start do
 
  p "publishing #{command}"
  MQ.fanout('system').publish command, :priority => 9

  EM.add_timer(1) do 
    EM.stop
  end

end

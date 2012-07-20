## RabbitMQ starter kit

This project provides some basic implementations of the concepts exposed
in my RabbitMQ presentation at http://www.rails-underground.com/
slides are available [on slideshare](http://www.slideshare.net/hungryblank/distributed-and-concurrent-programming-with-rabbitmq-and-eventmachine-rails-underground-2009 "Distributed and concurrent programming with RabbitMQ and EventMachine Rails Underground 2009")
## Description
  To start any of the scripts included you need to check first that you have a rabbitMQ server running on localhost.

  The project tree contains at the top level:

*   the message producer, a script that publishes messages on the 'jobs' queue

*   a system_command script, that publishes the argument passed on the 'system' queue

*   a heartbeat_monitor script that collects the messages on the heartbeat
    queue and polls the 'jobs' queue status

  The rest of project is divided into directories; every directory includes one or more consumer scripts.

  Multiple consumers and producers can be active at the same time 
  
## Requirements
  You need to have 

* amqp gem version 0.6.4 or later

* rabbitMQ server version 1.6.0 or later

## Howto
  After installing the software listed in the requirements, run

```bash
bundle install
```

  Open a console on your system, and from the top directory of this repository execute

```bash
ruby producer.rb
```

  this will start the producer script that will start publishing messages on
  the queue.

  After that open another console and always from the top directory of this
  repository execute

```bash
ruby heartbeat_monitor.rb
```

  This script will start printing out the number of messages in the queue.

  At this point you can open another console and start any of the consumers
  contained in the numbered directories. As an example try executing

```bash
ruby  002_simple_with_ack/consumer_simple_ack.rb
```

  The consumer will start printing out the messages coming from the queue.

  Do experiment trying to start multiple consumers or one by one in turn and
  observe how the heartbeat_monitor.rb output reacts to the number and types
  of consumer that are active at a given time.

## Authors
  Paolo Negri

http://github.com/hungryblank

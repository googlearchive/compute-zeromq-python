ZeroMQ Performance Tests
========================

Basic Performance Tests were run using ZeroMQ's [latency and throughput tests](http://www.zeromq.org/results:perf-howto).  These tests are for demonstration purposes and should not be considered a guarentee of any specific performance on GCE instances. 

Methodology:  
The latency and throughput tests were run for message sizes of 1, 2, 4, 8, 16, 32, ..., 32768 and 65536 bytes using 100,000 roundtrips/messages.  The tests were run on two n1-highcpu-4 instances in the us-central1-a zone.

Latency
-------

End-to-end latency for messages of up to 512 bytes remains fairly consistent, with a range from 255us to 269us.  The actual values will depend, of course, on the physical location of the machines where the instances are allocated.  As one would expect, latency increases with larger messages, topping out at 866us for 64kB messages.

![Latency](graphs/latency.png?raw=true)

Throughput
----------

Througput is a bit over 6.2 million messages per second for 1 byte messages dropping down to just under 2000 messages per second for 64kB messages. 

![ThroughputMsg](graphs/thr_msg.png?raw=true)

In terms of bandwitdh, there is a maximum throughput of 965 Mb/s with 64kB messages. 

![ThroughputMb](graphs/thr_mb.png?raw=true)

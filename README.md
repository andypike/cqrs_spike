Experimenting with CQRS and Rails
=================================

About
-----



Setting Up
----------

```
$ bundle install
$ brew install redis
$ redis-server
$ rails s
```

Useful Links
------------

* CQRS Diet Presentation: http://www.slideshare.net/cavalle/the-cqrs-diet
* CQRS Sample: https://github.com/cavalle/banksimplistic

Useful Commands
---------------

* Start Redis: ```$ redis-server```
* Redis command line: ```$ redis-cli```
* Delete all Redis keys: ```$ redis-cli KEYS "*" | xargs redis-cli DEL```
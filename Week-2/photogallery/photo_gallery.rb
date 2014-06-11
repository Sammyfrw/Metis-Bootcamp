require "sinatra"
require "active_record"
require "pg"

ActiveRecord:Base.establish_connection(
	(adapter: "postgresql",
	database: "photo_gallery",
  username: "postgres",
  password: ""
	)

  class Gallery < ActiveRecord:Base
  end

get "/" do
  galleries = Gallery.all
  erb(:index, locals: {
    galleries: galleries
    })
end

irb(main):001:0> require "active_record"
=> true
irb(main):002:0> require pg
NameError: undefined local variable or method `pg' for main:Object
        from (irb):2
        from c:/Ruby200/bin/irb:12:in `<main>'
irb(main):003:0> require "pg"
=> true
irb(main):004:0> ActiveRecord::Base.establish_connection(
irb(main):005:1* adapter: "postgresql",
irb(main):006:1* database: "photo_gallery"
irb(main):007:1> )
=> #<ActiveRecord::ConnectionAdapters::ConnectionPool:0x2f79de0 @mon_owner=nil,
@mon_count=0, @mon_mutex=#<Mutex:0x2f79d50>, @spec=#<ActiveRecord::ConnectionAda
pters::ConnectionSpecification:0x2f876a0 @config={:adapter=>"postgresql", :datab
ase=>"photo_gallery"}, @adapter_method="postgresql_connection">, @checkout_timeo
ut=5, @dead_connection_timeout=5, @reaper=#<ActiveRecord::ConnectionAdapters::Co
nnectionPool::Reaper:0x2f79d38 @pool=#<ActiveRecord::ConnectionAdapters::Connect
ionPool:0x2f79de0 ...>, @frequency=nil>, @size=5, @reserved_connections=#<Thread
Safe::Cache:0x2f79d08 @backend={}, @default_proc=nil>, @connections=[], @automat
ic_reconnect=true, @available=#<ActiveRecord::ConnectionAdapters::ConnectionPool
::Queue:0x2f79c60 @lock=#<ActiveRecord::ConnectionAdapters::ConnectionPool:0x2f7
9de0 ...>, @cond=#<MonitorMixin::ConditionVariable:0x2f79be8 @monitor=#<ActiveRe
cord::ConnectionAdapters::ConnectionPool:0x2f79de0 ...>, @cond=#<ConditionVariab
le:0x2f79b88 @waiters={}, @waiters_mutex=#<Mutex:0x2f79b40>>>, @num_waiting=0, @
queue=[]>>


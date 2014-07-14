require 'rack'

class HelloWorld
  def initialize
  end

  def call(env)
    status = 200
    header = {"Content-Type" => "text/plain"}
    body = [env.inspect]
    sleep 1
    [status, header, body]
  end
end

class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    timestamp = Time.now.to_i
    status, headers, body = @app.call(env)
    logged_time = Time.now.to_i - timestamp
    body << logged_time.to_s
    [status, headers, body]
  end
end


Rack::Handler::WEBrick.run Logger.new(HelloWorld.new), Port: 8000

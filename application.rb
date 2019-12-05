class Application
  def call(env)
    # env is a hash version of the request object specific to the web server. Rack does some work to give a normalized env so the middleware can behave consistently across web servers.

    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path == "/"
      resp.write "<h1>WELCOME HOME My name is Charly</h1>"
      resp.status = 200

    elsif req.path == "/cats"
      resp.write "<h1>MEOW</h1>"
      resp.status = 200
      
    else
      resp.write("THIS IS BAD... 404")
      resp.status = 404
    end

    resp.finish # implicit return of the status code, header, and body
  end
end
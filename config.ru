
run lambda { |env|
  req = Rack::Request.new(env)
  path = req.path_info
  if path == "/tvshow"
    [200, {'Content-Type'=>'text/plain'}, ['That 70s Show']]
  elsif path == "/random_tvshow"
    response = HTTParty.get('http://rocky-scrubland-68340.herokuapp.com/')
    puts response.body, response.code, response.message, response.headers.inspect
    [200, {'Content-Type'=>'text/plain'}, ['foobar']]
  else
    [200, {'Content-Type'=>'text/plain'}, ['Hello']]
  end

}

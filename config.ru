
run lambda { |env|
  req = Rack::Request.new(env)
  case req.path_info
  when /tvshow/
    [200, {'Content-Type'=>'text/plain'}, ['That 70s Show']]
  else when /random_tvshow/
    [200, {'Content-Type'=>'text/html'}, ['cheese']]
  else
    [200, {'Content-Type'=>'text/plain'}, ['Hello']]
  end

}

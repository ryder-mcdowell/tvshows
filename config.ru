require 'httparty'

run lambda { |env|
  request = Rack::Request.new(env)
  if request.path == "/"
    [200, {'Content-Type'=>'text/plain'}, ['Hello']]
  elsif request.path == "/tvshow"
    [200, {'Content-Type'=>'text/plain'}, ['That 70s Show']]
  elsif request.path == "/random_tvshow"
    hosts = [
      'evening-medow-91132',
      'obscure-beyond-97514',
      'whispering-mesa-29313',
      'shrouded-reaches-36777',
      'hidden-waters-81877',
      'fast-sea-58248',
      'rocky-scrubland-68340',
      'fathomless-stream-48840',
      'stark-citadel-67357',
      'tranquil-fjord-57959'
    ]
    hostname = hosts.sample
    response = HTTParty.get(hostname)
    [200, {'Content-Type'=>'text/plain'}, [response.body]]
  else
    [404, {'Content-Type'=>'text/plain'}, ['Not Found']]
  end

}

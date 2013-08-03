Her::API.setup url:'http://localhost:9292/'  do |c| #http://hitchhikersdr.herokuapp.com/'
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
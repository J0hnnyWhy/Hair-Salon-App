require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/clients')
require('./lib/stylists')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

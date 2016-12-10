require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  erb(:index)
end

post('/new_stylist') do
  name = params.fetch('new_stylist')
  Stylist.new({:name => name}).save()
  erb(:index)
end

get('/stylist/:id') do
  stylist_id = params.fetch('id').to_i()
  @stylist = Stylist.find(stylist_id)
  @clients = @stylist.clients()
  erb(:index)
end

post('/new_client') do
  name = params.fetch('new_client')
  stylist_id = params.fetch('new_client_stylist')
  Client.new({:name => name, :stylist_id => stylist_id}).save()
  erb(:index)
end

get('/client/:id') do
  client_id = params.fetch('id').to_i()
  @client = Client.find(client_id)
  @stylist = Stylist.find(@client.stylist_id())
  erb(:client)
end

patch('/stylist_update/:id') do
  new_stylist_id = params.fetch('stylist_update')
  client = Client.find(params.fetch('id').to_i())
  client.update({:stylist_id => new_stylist_id})
  erb(:index)
end

delete('/delete_client/:id') do
  client = Client.find(params.fetch('id').to_i())
  client.delete()
  erb(:index)
end

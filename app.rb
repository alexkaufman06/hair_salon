require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylists")
require("./lib/clients")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

post("/stylists") do
  stylist_name = params.fetch('stylist_name')
  Stylist.new({ :name => stylist_name }).save()
  erb(:index)
end

delete("/stylists") do
  stylist_id = params.fetch('stylist_id').to_i()
  Stylist.find(stylist_id).delete()
  erb(:index)
end

get("/clients/:id") do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

post("/clients") do
  client_name = params.fetch('client_name')
  stylist_id = params.fetch('stylist_id').to_i()
  client = Client.new({ :name => client_name })
  client.save()
  @stylist = Stylist.find(stylist_id)
  @stylist.add_client(client)
  erb(:stylist)
end

delete("/clients") do
  client_id = params.fetch('client_id').to_i()
  stylist_id = params.fetch('stylist_id').to_i()
  Client.find(client_id).delete() 
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end

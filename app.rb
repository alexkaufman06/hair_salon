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

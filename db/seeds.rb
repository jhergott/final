# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ball.delete_all

[
{:brand => "Bridgestone", :name => "Bridgestone Tour B330", :price => 4499, :ball_url => "http://geg.gmncdn.com/wp-content/uploads/2012/01/bstone-ball.jpg", :compression => "High"},
{:brand => "Titleist", :name => "Titleist ProV1", :price => 4999, :ball_url => "http://www.titleist.com/images/pressreleases/PROV1_flat.jpg", :compression => "High"},
{:brand => "Titleist", :name => "Titleist DT Solo", :price => 1999, :ball_url => "http://www.palmbeachgolfcenter.com/images/products/detail/titleist_dt.jpg", :compression => "Mid"},
{:brand => "TaylorMade", :name => "TaylorMade SuperDeep", :price => 1999, :ball_url => "http://demandware.edgesuite.net/aais_prd/on/demandware.static/Sites-TMaG-Site/Sites-tmag-master-catalog/default/v1430641053918/hero/Super-Deep_Ball-Package_Lid_zoom.jpg", :compression => "Low"}
].each do |ball_hash|
  b = Ball.new
  b.brand = ball_hash[:brand]
  b.name = ball_hash[:name]
  b.price = ball_hash[:price]
  b.ball_url = ball_hash[:ball_url]
  b.compression = ball_hash[:compression]
  b.save
end

Driver.delete_all

[
{:brand => "Nike", :name => "Nike Vapor Pro Driver", :price => 39900, :driver_url => "http://www.mcguirksgolf.com/v4/a636a571-361b-4659-a8dc-bf75b5a14aac/uploads/Nike%20Vapor%20Pro%20Driver%202.png", :launch => "Low", :spin => "Low"},
{:brand => "Ping", :name => "Ping G30 SF Tec Driver", :price => 34900, :driver_url => "http://www.golfsmith.com/_site_images/pp_copy/g30_driver_variable_thickness_face.jpg", :launch => "High", :spin => "Mid"},
{:brand => "Callaway", :name => "Callaway XR Pro Driver", :price => 39900, :driver_url => "http://www.pgatour.com/content/pgatour/equipmentreport/2015/01/15/callaway-xr-driver/_jcr_content/mainParsys/blog/blogLeftParsys/image.img.jpg/1421354971163.jpg", :launch => "Low", :spin => "Low"}
].each do |driver_hash|
  d = Driver.new
  d.brand = driver_hash[:brand]
  d.name = driver_hash[:name]
  d.price = driver_hash[:price]
  d.driver_url = driver_hash[:driver_url]
  d.launch = driver_hash[:launch]
  d.spin = driver_hash[:spin]
  d.save
end

Iron.delete_all

[
{:brand => "Cobra", :name => "Cobra Fly-Z Irons", :price => 80000, :iron_url => "http://www.golfwrx.com/wp-content/uploads/2014/12/CobraFlyZForged.jpg", :category => "Game-Improvement"},
{:brand => "Titleist", :name => "Titleist AP2 714 Irons", :price => 110000, :iron_url => "http://www.mygolfspy.com/wp-content/uploads/2013/09/Titleist-714-AP2.jpg", :category => "Better-Player"},
{:brand => "Ping", :name => "Ping Kartsen Irons", :price => 65000, :iron_url => "http://pinggolf-blob.ping.com/pinggolf/uploadedimages/clubs/irons/karsten/beauty.png", :category => "Max Game-Improvement"}
].each do |iron_hash|
  i = Iron.new
  i.brand = iron_hash[:brand]
  i.name = iron_hash[:name]
  i.price = iron_hash[:price]
  i.iron_url = iron_hash[:iron_url]
  i.category = iron_hash[:category]
  i.save
end



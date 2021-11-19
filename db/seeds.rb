require "csv"

WineOrder.delete_all
Order.delete_all
Status.delete_all
Customer.delete_all
Province.delete_all
Wine.delete_all
Winery.delete_all
Variety.delete_all
Region.delete_all

fileName = Rails.root.join("db/wines.csv")
csv_data = File.read(fileName)
wines = CSV.parse(csv_data, headers: true, encoding: "utf-8")

wines.each do |w|
  variety = Variety.find_or_create_by(name: w["variety"])

  winery = Winery.find_or_create_by(name: w["winery"])

  region = Region.find_by(name: w["region"])
  region ||= Region.create(name:     w["region"],
                           province: w["province"],
                           country:  w["country"])

  next unless variety&.valid? && winery&.valid? && region&.valid?

  wine = Wine.create(
    name:        w["name"],
    description: w["description"],
    price:       w["price"],
    variety:     variety,
    winery:      winery,
    region:      region
  )
end

puts Wine.count
puts Variety.count
puts Winery.count
puts Region.count

fileName = Rails.root.join("db/provinces.csv")
csv_data = File.read(fileName)
provinces = CSV.parse(csv_data, headers: true, encoding: "utf-8")

provinces.each do |p|
  province = Province.create(
    name: p["name"],
    pst:  p["pst"],
    gst:  p["gst"],
    hst:  p["hst"]
  )
end

puts Province.count

statuses = ["pending", "paid", "shipped"]

statuses.each do |s|
  status = Status.create(
    name: s
  )
end

Status.count
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
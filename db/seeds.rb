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

wines.each do |wine|
  variety = Variety.find_or_create_by(name: wine["variety"])

  winery = Winery.find_or_create_by(name: wine["winery"])

  region = Region.find_by(name: wine["region"])
  region ||= Region.create(name:     wine["region"],
                           province: wine["province"],
                           country:  wine["country"])

  next unless variety&.valid? && winery&.valid? && region&.valid?

  wine = Wine.create(
    name:        wine["name"],
    description: wine["description"],
    price:       wine["price"],
    variety:     variety,
    winery:      winery,
    region:      region
  )
end

puts Wine.count

puts Variety.count

puts Winery.count

puts Region.count

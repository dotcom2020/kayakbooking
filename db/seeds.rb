require "faker"
require "open-uri"

addresses = [
  "3 Rue Halle Delacroix, 13001 Marseille",
  "27 Rue Tupin, 69002 Lyon",
  "3 Rue de la Cité, 75004 Paris",
  "22 Rue Engel Dollfus, 68200 Mulhouse",
  "208 Rue Léon Gambetta, 59800 Lille"
]

photos = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sea_Kayak.JPG/1200px-Sea_Kayak.JPG",
  "https://resize1.prod.docfr.doc-media.fr/s/1200/ext/eac4ff34/content/2022/7/3/kayak-mer1-c30e213f0e8b374f.jpeg",
  "https://echosondeurs.files.wordpress.com/2020/10/20200924_141000.jpg?w=1024",
  "https://cdn.generationvoyage.fr/2020/11/kayak-visiter-medoc-630x420.jpg",
  "https://kayakyourlife.com/wp-content/uploads/2021/06/canoe-kayak-gonflable-randonnee-fond-haute-pression-drop-stitch-x100-4-places-3.jpg"
]

puts "destroy all instances"

User.destroy_all
Booking.destroy_all
Kayak.destroy_all

puts "creating users"

User.create!(
  email: "loris@loris.com", 
  password: "azerty", 
  first_name: "Loris", 
  last_name: "Reynaud", 
  address: "Marseille", 
  description: "truc"
)
User.create!(
  email: "nicolas@nicolas.com", 
  password: "azerty", 
  first_name: "Nico", 
  last_name: "Nicolas", 
  address: "Paris", 
  description: "machin"
)
User.create!(
  email: "nassim@nassim.com", 
  password: "azerty", 
  first_name: "Nassim", 
  last_name: "Nas", 
  address: "Nyon", 
  description: "truc"
)
User.create!(
  email: "pirasanth@pirasanth.com", 
  password: "azerty", 
  first_name: "Pirasanth", 
  last_name: "Pira", 
  address: "Bordeaux", 
  description: "machin"
)

puts "creating kayaks"
a = 0
photo = 0

5.times do
  kayak = Kayak.new(
    user_id: User.all.sample.id,
    price_per_day: rand(50..500),
    adress: addresses[a],
    description: Faker::Lorem.paragraph(sentence_count: 4),
    color: ["Blue", "Green", "Yellow", "Orange", "Grey"].sample,
    category: Kayak::CATEGORIES.sample,
    length: rand(150..300),
    width: rand(40..50),
    buoy: [true, false].sample,
    places: [1, 2].sample
  )
  file = URI.open(photos[photo])
  kayak.photo.attach(io: file, filename: 'kayak.jpg', content_type: 'image/jpg')
  kayak.save!

  a += 1
  photo += 1
end

puts "Seed terminated !"

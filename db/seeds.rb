User.delete_all
User.create!(name: "Buba",
             email: "b@b.b",
             phone: "550077",
             password: "bbbbbbbb",
             password_confirmation: "bbbbbbbb")

5.times do |n|
  name  = Faker::Name.name
  email = "mail#{n+1}@gmai.org"
  password  = "password"
  phone  = Faker::PhoneNumber.subscriber_number(6)
  User.create!(name: name,
               email: email,
               phone: phone,
               password: password,
               password_confirmation: password)
end

Product.delete_all
Product.create!(
  user_id: User.first.id,
  title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95)

Product.create!(
  user_id: User.first.id,
  title: 'CoffeeScript',
  description:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
      functionality wrapped in a cleaner, more succinct syntax. In the first
      book on this exciting new language, CoffeeScript guru Trevor Burnham
      shows you how to hold onto all the power and flexibility of JavaScript
      while writing clearer, cleaner, and safer code.
      </p>},
  image_url:   'rtp.jpg',
  price: 36.00)

User.last(6).each do |k|
  2.times do
    title =  Faker::Commerce.department
    description = Faker::Lorem.paragraph
    image_url = 'buy.jpg'
    price = Faker::Number.number(2)
    Product.create!(user_id: k.id, title: title, description: description, image_url: image_url, price: price )
  end
end

# Klass.last(2).each do |k|
#   %w[хімія біологія].each{|s| Subject.create_with(klass_id: k.id).find_or_create_by(name: s)}
# end
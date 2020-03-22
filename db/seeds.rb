# frozen_string_literal: true

Product.destroy_all
Customer.destroy_all
Order.destroy_all

products = Product.create(
  [
    { name: 'Bread', price: 8.0, category: 'bread' },
    { name: 'Cheddar soda bread', price: 6.0, category: 'bread' },
    { name: 'Spiced potato bun', price: 3.5, category: 'pastry' },
    { name: 'Mushroom, potato & taleggio tart', price: 4.0, category: 'pastry' },
    { name: 'Apple & hazelnut galette', price: 3.9, category: 'pastry' },
    { name: 'Cinnamon bun', price: 3.0, category: 'pastry' },
    { name: 'Lemon drizzle cake (whole)', price: 25.0, category: 'cake' },
    { name: 'Lemon drizzle cake (slice)', price: 2.8, category: 'cake' },
    { name: 'Dark chocolate cake (whole)', price: 25.0, category: 'cake' },
    { name: 'Dark chocolate cake (slice)', price: 2.8, category: 'cake' },
    { name: 'Scottish gingerbread cake (whole)', price: 25.0, category: 'cake' },
    { name: 'Scottish gingerbread cake (slice)', price: 2.8, category: 'cake' },
    { name: 'Banana hazelnut cake (whole)', price: 25.0, category: 'cake' },
    { name: 'Banana hazelnut cake (slice)', price: 2.8, category: 'cake' },
    { name: 'Carrot cake w/ cream cheese (whole)', price: 30.0, category: 'cake' },
    { name: 'Carrot cake w/ cream cheese (slice)', price: 3.2, category: 'cake' },
    { name: 'Brownie w/ sea salt (whole)', price: 25.0, category: 'cake' },
    { name: 'Brownie w/ sea salt (slice)', price: 2.5, category: 'cake' },
    { name: 'Three seed, date & almond cookie', price: 2.6, category: 'biscuits & cookies' },
    { name: 'Chocolate, sour cherry & almond cookie', price: 2.6, category: 'biscuits & cookies' },
    { name: 'Fig, hazelnut & vanilla bar x 6', price: 13.0, category: 'pantry' },
    { name: 'Fig, hazelnut & vanilla bar', price: 2.6, category: 'biscuits & cookies' },
    { name: 'Peanut butter & chocolate cookie', price: 2.4, category: 'biscuits & cookies' },
    { name: 'Chocolate chip cookie', price: 2.0, category: 'biscuits & cookies' },
    { name: 'Florentine x 5', price: 9.0, category: 'pantry' },
    { name: 'Florentine', price: 2.0, category: 'biscuits & cookies' },
    { name: 'Scottish shortbread x 10', price: 10.0, category: 'pantry' },
    { name: 'Scottish shortbread', price: 1.7, category: 'biscuits & cookies' },
    { name: 'Millionaire shortbread', price: 3.0, category: 'biscuits & cookies' },
    { name: 'Granola', description: '400 g', price: 7.5, category: 'pantry' },
    { name: 'Salted caramels', price: 7.0, category: 'pantry' },
    { name: 'Scottish tablet', price: 6.5, category: 'pantry' },
    { name: 'Peanut butter', price: 7.0, category: 'pantry' },
    { name: 'Raspberry jam', price: 7.0, category: 'pantry' },
    { name: 'Rhubarb & star anise jam', price: 7.0, category: 'pantry' },
    { name: 'Chocolate chip cookie x 6', price: 10.0, category: 'pantry' },
    { name: 'Cheddar & black pepper shortbread x 10', price: 10.0, category: 'pantry' }
  ]
)

customers = 10.times.map do
  Customer.create(
    name: FFaker::Name.unique.name,
    email: FFaker::Internet.email,
    address: "#{FFaker::AddressDE.street_address}\n#{FFaker::AddressDE.zip_code}-Berlin",
    telephone: [FFaker::PhoneNumberDE.mobile_phone_number, ""].sample
  )
end

orders = 10.times.map do
  Order.create(delivery_method: %w[delivery pickup].sample,
               note: FFaker::Lorem.paragraph)
end

orders.each do |order|
  order.products = products.sample(rand(1..5))
  order.customer = customers.shift
  order.save!
end

LineItem.all.each do |line_item|
  line_item.quantity = rand(1..3)
  line_item.save!
end

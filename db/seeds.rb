# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
require 'ffaker'

CATEGORIES = ['Food', 'Entertainment', 'Pets', 'School', 'Others']

# Create test user
User.create!(
  email: 'test@email.com',
  name: 'Juan Perez',
  password: '12341234',
  password_confirmation: '12341234'
)

# Create test user's friends
5.times do |time|
  password = SecureRandom.hex(4)
  User.create!(
    email: FFaker::Internet.email,
    name: FFaker::Name.name,
    password: password,
    password_confirmation: password
  )
end

group = Group.create!(name: 'Amigochos')

User.all.each do |user|
  BankAccount.create!(name: "Banregio", account_number: rand(10 ** 10), user: user)
  CATEGORIES.each do |category|
    Goal.create!(category: category, amount: rand(1000..5000), user: user)
  end
  Membership.create!(group: group, user: user)
end

BankAccount.all.each do |bank_account|
  12.times do
    Income.create!(
      amount: rand(20000..25000),
      bank_account: bank_account,
      transaction_number: SecureRandom.hex(6),
      description: FFaker::Book.description,
      transaction_date: FFaker::Time.between('2018-02-24 16:20', '2019-02-24 16:20')
    )
  end

  250.times do
    Expense.create!(
      amount: rand(100..3000),
      bank_account: bank_account,
      transaction_number: SecureRandom.hex(6),
      description: FFaker::Book.description,
      category: CATEGORIES.sample,
      transaction_date: FFaker::Time.between('2018-02-24 16:20', '2019-02-24 16:20')
    )
  end
end

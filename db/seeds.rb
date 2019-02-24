# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

CATEGORIES = [
  'Food',
  'Entertainment',
  'Pets',
  'School',
  'Others'
]

TRANSACTION_NUMER = 1

5.times do |time|
  email = "test#{time}@mail.com"
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  password = '12341234'
  User.create(email: email, name: name, password: password, password_confirmation: password)
end

User.find_each do |user|
  bank_name = "#{FFaker::Address.city} bank"
  account_number = '1234567890'
  BankAccount.create(name: bank_name, account_number: account_number, user: user)
end

BankAccount.find_each do |ba|
  25.times do
    Income.create(
      amount: rand(1..1500),
      bank_account: ba,
      transaction_number: TRANSACTION_NUMER,
      description: "#{FFaker::Book.description}",
      transaction_date: FFaker::Time.between('2018-11-01 16:20', '2019-02-24 16:20')
    )
    TRANSACTION_NUMER += 1
  end

  25.times do
    Expense.create(
      amount: rand(1..1500),
      bank_account: ba,
      transaction_number: TRANSACTION_NUMER,
      description: "#{FFaker::Book.description}",
      category: CATEGORIES.sample,
      transaction_date: FFaker::Time.between('2018-11-01 16:20', '2019-02-24 16:20')
    )
    TRANSACTION_NUMER += 1
  end
end

goals = Goal.create([
  {
    category: 'Entertainment',
    amount: 5500,
    user_id: 1
  },
  {
    category: 'Food',
    amount: 9000,
    user_id: 1
  },
  {
    category: 'School',
    amount: 4500,
    user_id: 1
  },
  {
    category: 'Pets',
    amount: 2000,
    user_id: 1
  },
  {
    category: 'Others',
    amount: 5000,
    user_id: 1
  }
])

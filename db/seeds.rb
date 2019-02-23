# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
      email: 'tester1@gmail.com',
      password: '123456'
    },
    {
      email: 'tester2@gmail.com',
      password: '123456'
    },
    {
      email: 'tester3@gmail.com',
      password: '123456'
    },
    {
      email: 'tester4@gmail.com',
      password: '123456'
    },
    {
      email: 'tester5@gmail.com',
      password: '123456'
    },
  ]
)

bank_accounts = BankAccount.create([
    {
      name: 'Banco del ahorro',
      account_number: '1012344125562',
      user_id: 1
    }
  ]
)

goals = Goal.create([
    {
      category: 'Entertainment',
      amount: 2500,
      user_id: 1
    },
    {
      category: 'Food',
      amount: 4800,
      user_id: 1
    },
    {
      category: 'School',
      amount: 5500,
      user_id: 1
    },
    {
      category: 'Pets',
      amount: 450,
      user_id: 1
    },
    {
      category: 'Others',
      amount: 1000,
      user_id: 1
    }
  ]
)

expenses = Expense.create([
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 50
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 10
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 100
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 200
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 50
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 50
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 10
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 100
    },
    {
      bank_account_id: 1,
      category: 'Entertainment',
      amount: 200
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 50
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 100
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 250
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 45
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 99
    },
    {
      bank_account_id: 1,
      category: 'Food',
      amount: 60
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 60
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 200
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 500
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 20
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 60
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 100
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 200
    },
    {
      bank_account_id: 1,
      category: 'School',
      amount: 400
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 40
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 52
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 30
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 35
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 10
    },
    {
      bank_account_id: 1,
      category: 'Pets',
      amount: 10
    },
    {
      bank_account_id: 1,
      category: 'Others',
      amount: 50
    },
    {
      bank_account_id: 1,
      category: 'Others',
      amount: 100
    },
    {
      bank_account_id: 1,
      category: 'Others',
      amount: 150
    },
    {
      bank_account_id: 1,
      category: 'Others',
      amount: 200
    },
    {
      bank_account_id: 1,
      category: 'Others',
      amount: 250
    }
  ]
)

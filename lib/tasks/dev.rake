CATEGORIES = [
  'Entertainment',
  'Food',
  'School',
  'Pets',
  'Others'
]

if Rails.env.development?
  namespace :dev do
    task prime: 'db:setup' do
      10.times do |index|
        User.create(
          name: "Sofía Rodríguez-#{index}",
          email: "tester#{index}@gmail.com",
          password: 123456
        )
      end

      BankAccount.create(
        name: 'Banco del ahorro',
        account_number: 1012344125,
        user_id: 1
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

      50.times do
        Expense.create(
          bank_account_id: 1,
          category: CATEGORIES.sample,
          amount: rand(10..500)
        )
      end
    end
  end
end

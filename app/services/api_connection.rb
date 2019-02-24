class ApiConnection
  class_attribute :api_client_id
  self.api_client_id = 'NJzlf5PkenKdhBiI0Zdd2KTqerENVzDgKdR78d0x'
  class_attribute :api_client_secret
  self.api_client_secret = 'eTe3gkkwe4HFjAx6im4Czua1edizwl6i7XSYzDS06pyGuZJzlcxqzbDXHlxGB0MmtTUNtRRW4UboHaUly5J7rXLQNSKZm0Vt3YUzwhhQQQbI3JKARcAiH6r3XSC1mSkS'
  class_attribute :api_redirect_uri
  self.api_redirect_uri = 'http://localhost:3000/api_callbacks/new'
  class_attribute :api_endpoint
  self.api_endpoint = 'https://api-sandbox.brlabsdev.com:9447'

  def initialize(code, user)
    @user = user
    @auth_token =  new_auth_token(code)['access_token']
  end

  def retrieve_bank_account
    account = account_list['accounts'].first
    @bank_account = BankAccount.find_by_or_create(user: @user, account_number: account['account_number'], name: account['clabe'])
  end

  def retrieve_transactions
    movements = movement_list['transactions']
    movements.each do |movement|
      if movement['amount'] > 0
        date = movement['date'].split('/')
        date = Datetime.new(date[0], date[1], date[2])
        Income.find_by_or_create(amount: movement['amount'], bank_account_id: @banck_account.id, date_moved: date, transaction_number: movement['transaction_number'])
      else
        date = movement['date'].split('/')
        date = Datetime.new(date[0], date[1], date[2])
        Expense.find_by_or_create(amount: movement['amount'], bank_account_id: @banck_account.id, date_moved: date, category: movement['details']['category'], transaction_number: movement['transaction_number'])
      end
    end
  end

  private

  def movement_list(min_date = nil, max_date = nil)
    get("/accounts/#{@banck_account.id}/transactions/")
  end

  def account_list
    query = {}
    get('/accounts/')
  end

  def new_auth_token(auth_code)
    body = "grant_type=authorization_code&code=#{auth_code}&client_id=#{api_client_id}&client_secret=#{api_client_secret}&redirect_uri=#{api_redirect_uri}"
    post('/oauth/token/', body)
  end

  def get(path)
    domain = api_endpoint + path
    headers = {'Content-Type' => 'application/json', 'Accept' => 'application/vnd.banregio-v0.0.beta1+json', 'Authorization' => "Bearer #{@auth_token}"}
    JSON.parse(Excon.get(domain, :headers => headers).body)
  end

  def post(path, body)
    domain = api_endpoint + path
    headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    JSON.parse(Excon.post(domain, :body => body, :headers => headers).body)
  end
end

class ApiConnection
  class_attribute :api_client_id
  self.api_client_id = 'rpYNJ4HRSfEmbFyvUoTOs0yQkcBodfZfZTUaRZ5v'
  class_attribute :api_client_secret
  self.api_client_secret = 'a8b7UTjvLjYFaK0gCZzZYkmEZQq0AveDagaU2vmUeOoHhOLIPDP2HwCykAiNMnYMCFe7FqpKKnkiFLOzPTF1ln1up0dt8SLBIs24PaeqFYu5UuS5VMMfP26rSSwhldIg'
  class_attribute :api_redirect_uri
  self.api_redirect_uri = 'http://localhost:3000/api_callbacks/new'
  class_attribute :api_endpoint
  self.api_endpoint = 'https://api-sandbox.brlabsdev.com:9447'

  def initialize(code, user)
    @auth_code = code
    @user = user
    @auth_token = new_auth_token['access_token']
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
    if min_date.nil? || max_date.nil?
      query = {}
    else
      query = {'min_date' => min_date, 'max_date' => max_date}
    end
    get("accounts/#{@account_id}/transactions/", query)
  end

  def account_list
    query = {}
    get('/accounts/', query)
  end

  def new_auth_token
    body = URI.encode_www_form({'grant_type' => 'authorization_code', 'code' => @auth_code, 'client_id' => api_client_id, 'client_secret' => api_client_secret, 'redirect_uri' => api_redirect_uri})
    post('/oauth/token/', body)
  end

  def auth_token_refresh
    body = URI.encode_www_form({'grant_type' => 'refresh_token', 'client_id' => api_client_id, 'client_secret' => api_client_secret})
    post('/oauth/token/', body)
  end

  def get(path, query)
    domain = api_endpoint + path
    headers = {'Accept' => 'application/json', 'Authorization' => "Bearer #{@auth_token}"}
    Excon.get(domain, :headers => headers, :query => query).body
  end

  def post(path, body)
    domain = api_endpoint + path
    headers = {'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json'}
    Excon.post(domain, :body => body, :headers => headers).body
  end
end

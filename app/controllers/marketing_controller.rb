class MarketingController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    render "pages/landing"
  end
end

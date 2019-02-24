class GoalsController < ApplicationController
  def new
    init_goal_list
  end

  def create
    params["goal_list"].each do |g|
      @goal = Goal.new(goal_params(g))
      unless @goal.save
        init_goal_list
        render :new
        return
      end
    end
    redirect_to new_group_path
  end

  def init_goal_list
    @goal_list = []
    2.times do
      @goal_list << Goal.new
   end
  end

  def convert_percentage_to_number(user_amount)
    user_amount.to_f * current_user.monthly_income/100
  end

  def goal_params(individual_params)
    individual_params.
    permit(:category, :amount).
    merge(default_params(individual_params))
  end

  def default_params(individual_params)
    {
      user: current_user,
      amount: convert_percentage_to_number(individual_params[:amount])
    }
  end
end

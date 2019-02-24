class GoalsController < ApplicationController
  def new
    init_goal_list
  end

  def create
    params["goal_list"].each_with_index do |g, i|
      @goal = Goal.new(goal_params(g.merge(category: i)))
      unless @goal.save
        init_goal_list
        render :new
        return
      end
    end
    redirect_to new_group_path
  end

  CATEGORIES = {
    0 => 'Entertainment',
    1 => 'Food',
    2 => 'School',
    3 => 'Pets',
    4 => 'Others'
  }.freeze

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
    merge(calculated_params(individual_params))
  end

  def calculated_params(individual_params)
    {
      user: current_user,
      category: CATEGORIES[individual_params[:category].to_i],
      amount: convert_percentage_to_number(individual_params[:amount])
    }
  end
end

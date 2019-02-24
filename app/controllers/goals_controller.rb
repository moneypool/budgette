class GoalsController < ApplicationController
  def new
    # @goal_list = []
    # 2.times do
    #   @goal_list << Goal.new
    @goal = Goal.new
   # end
  end

  def create
    # params["goal_list"].each do |goal|
    #   # Goal.create(goal_params(goal))
    #   @goal = Goal.new(goal_params(goal))
    #
    #   unless @goal.save
    #     render :show and return
    #   end
    # end
    # render :show

    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to new_group_path
    else
      render :new
    end
  end

  def convert_percentage_to_number(user_amount)
    user_amount.to_f * current_user.monthly_income/100
  end

  def default_params
    {
      user: current_user,
      amount: convert_percentage_to_number(params[:goal][:amount])
    }
  end

  def goal_params
    params.
    require(:goal).
      permit(:category, :amount).
      merge(default_params)
  end
end

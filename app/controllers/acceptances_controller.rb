class AcceptancesController < ApplicationController
  def new
    @group = Group.friendly.find(params[:group_id])

    if user_signed_in?
      # if @group.accept_invitation(current_user)
      #   redirect_to(
      #     onboarding_policy.root_path,
      #     notice: "You've been added to the team. Enjoy!",
      #   )
      # else
      #   flash[:error] = t(".invitation_taken")
      #   render :new
      # end
    else
      # session[:group_invitation_id] = params[:group_id]
      # render :new
    end
  end
end

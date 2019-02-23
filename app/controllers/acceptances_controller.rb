class AcceptancesController < ApplicationController
  def new
    @group = Group.friendly.find(params[:group_id])

    if user_signed_in?
      if @group.add_user(current_user)
        redirect_to(
          group_path(@group),
          notice: "You've been added to the group. Enjoy!",
        )
      else
        flash[:error] = "There was an error with your request."
        render :new
      end
    else
      session[:group_invitation_id] = params[:group_id]
      render :new
    end
  end
end

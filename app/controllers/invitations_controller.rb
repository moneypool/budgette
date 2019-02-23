class InvitationsController < ApplicationController
  def show
    @group = Group.friendly.find(params[:group_id])
  end
end

class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.friendly.find(params[:id])
    @rankings = @group.rankings
  end

  def new
    @group = Group.new
  end

  def create
    @group_form = GroupForm.new(group_params)

    if @group_form.save
      redirect_to group_invitation_path(@group_form.group), notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name).merge(user: current_user)
  end
end

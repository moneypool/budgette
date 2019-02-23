class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = GroupForm.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name).merge(user: current_user)
  end
end

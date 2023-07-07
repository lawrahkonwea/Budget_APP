class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.created_by_current_user(current_user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

class TransfersController < ApplicationController
  before_action :authenticate_user!

  def index
    @transfers = Transfer.joins(:groups).where(groups: { id: params[:group_id] }).order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  def new
    @transfer = Transfer.new
    @groups = Group.created_by_current_user(current_user)
  end

  def create
    if params[:transfer][:group_ids].present? && params[:transfer][:group_ids].all? do |id|
         id.to_i.zero?
       end
      render :new
      return
    end
    params = transfer_params
    @transfer = Transfer.new(name: params[:name], amount: params[:amount])
    @transfer.author = current_user
    @groups_id = params[:group_ids]

    @groups_id.each do |id|
      group = Group.find(id) unless id == '0'
      @transfer.groups.push(group) unless group.nil?
    end

    if @transfer.save
      redirect_to group_transfers_path(@transfer.groups.first.id), notice: 'Transfer added successfully'
    else
      render :new
    end
  end

  def show
    @transfer = Transfer.find(params[:id])
  end

  def transfer_params
    params.require(:transfer).permit(:name, :amount, group_ids: [])
  end
end

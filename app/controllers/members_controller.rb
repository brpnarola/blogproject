class MembersController < ApplicationController
  before_action :set_member, only: %w(show edit delete update)

  ## list members
  def index
    @members = Member.all
  end

  ## new member
  def new
    @member = Member.new
  end

  ## get member
  def show
  end

  ## edit member
  def edit
  end

  ## create member
  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to member_path(@member)
    else
      render :new
    end
  end

  ## update member
  def update
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  ## delete member record
  def delete
    @member.destroy
    redirect_to members_path
  end

  private

  def set_member
    @member = Member.find_by(id: params[:id])
  end
end

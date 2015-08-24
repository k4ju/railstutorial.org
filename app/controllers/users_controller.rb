class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new()
  end
  
  def index
  end
  
  def update
  end
  
  def edit
  end
  
  def destroy
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #Do save
    else
      render 'new'
    end
  end
  
end

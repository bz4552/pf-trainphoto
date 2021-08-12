class Public::UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  
  def show
  end
  
  def edit
  end
  
  def new
  end
  
  def update
  end
  
  def withdraw
  end
  
end

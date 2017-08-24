class UsersController < ApplicationController
	before_action :authenticate_user, except: index

  def index
  	@users = User.all
  end

  def show
  	@user - User.fin
  end

  def destroy
  	@user.delete
  end

end
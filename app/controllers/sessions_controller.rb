class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:current_user] = user.id
      redirect_to events_path
    else
      flash[:alert] = 'There is no user with that name'
      render :new  
    end
  end

  def destroy
  end
end

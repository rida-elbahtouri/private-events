def UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User successfully created"
            redirect_to @user
            sign_in(@user.id)
        else
            flash[:alert] = "User couldn't be created"
            render :new    
        end    
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end 
    
    def sign_in(id)
        if User.find(id)
            session[:user_id] = id
            return true
        end
        return false   
    end    
end
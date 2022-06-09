class UsersController < ApplicationController
    def index
        @users= User.all
    end

    def show
        @user=User.find(params[:id])
        
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_details)
        if @user.save
         redirect_to @user
        else
         render :new ,status: :unprocessable_entity
        end

    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.save(user_details)
         redirect_to @user
        else
         render :edit ,status: :unprocessable_entity
        end
    end

    def destroy
        @user=User.find(params[:id])
        @user.destroy

        redirect_to root_path, status: :see_others
    end

    private
    def user_details
        params.require(:user).permit(:name,:email)
    end
end

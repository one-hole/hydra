module Admin
  class UsersController < BaseController

    def create
      build_user
      render json:
        @user, status: 201
    end

    def update
    end

    private

    def build_user
      @user = User.create(user_params)
    end

    def user_params
      params.require(:user).permit(:phone, :password, :password_confirmation, :name)
    end
  end
end
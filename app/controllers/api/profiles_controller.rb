module Api
  class ProfilesController < BaseController

    before_action :authenticate

    def show
      render json:
        @current_user, serializer: ProfilesIndexSerializer
    end

    # 商家更新自己的收款二维码
    def update

    end

    private

    def load_profile

    end
  end
end

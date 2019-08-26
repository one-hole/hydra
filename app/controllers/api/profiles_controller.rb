module Api
  class ProfilesController < BaseController

    before_action :authenticate

    def show
      render json:
        @current_user, serializer: ProfilesIndexSerializer, root: 'data', status: 200
    end

    # 商家更新自己的收款二维码
    def update
      current_user.profile.update(profile_params)
      render json:
        @current_user.reload, serializer: ProfilesIndexSerializer, root: 'data', status: 201
    end

    private

    def profile_params
      params.require(:profile).permit(:wx, :zfb, :qq, :ysf, :jd)
    end
  end
end

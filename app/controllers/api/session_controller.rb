=begin
  手机号
  密码
=end
module Api
  class SessionController < BaseController
  
    def create
    end

    def destroy
    end

    private
      def load_user
        @user ||= User.find_by(phone: params[:phone])
      end

  end
end
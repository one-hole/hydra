=begin
  手机号
  密码
=end

module Api
  class SessionController < ActionController::API
  
    # POST /session
    def create
      load_user
      authenticate
      render json: {
        data: {
          user: {
            token: @user.token
          }
        }
      }, status: 201
    end

    # DELETE /session
    def destroy; end

    private

    def load_user
      @user ||= User.find_by(phone: params[:phone])
      raise PhoneNotFoundError unless @user
    end

    def authenticate
      raise PasswordError unless @user.authenticate(params[:password])
    end

  end
end
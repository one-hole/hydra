require "aliyun/oss"
require "aliyun/sts"

class OssController < ActionController::API

  def index
    @sts_token = build_sts_token
    render json: {
      bucket: "onehole-assets",
      endpoint: "oss-cn-hangzhou.aliyuncs.com",
      object_key: build_asset_path,
      access_key_id: @sts_token.access_key_id,
      access_key_secret: @sts_token.access_key_secret,
      security_token: @sts_token.security_token,
      expiration_time: @sts_token.expiration
    }, status: 200
  end

  private

  def build_sts_token
    client = Aliyun::STS::Client.new(
      access_key_id: Rails.application.credentials[Rails.env.to_sym][:aliyun][:access_key_id],
      access_key_secret: Rails.application.credentials[Rails.env.to_sym][:aliyun][:access_key_secret]
    )

    allow_actions = %w(oss:*)
    policy = Aliyun::STS::Policy.new
    policy.allow(allow_actions, ['acs:oss:*:*:onehole-assets/*'])
    token = client.assume_role(my_role, 'onehole-weiant-session', policy, 3600)
  end

  def my_role
    Rails.application.credentials[Rails.env.to_sym][:aliyun][:sts_role]
  end

  def build_asset_path
    "#{params[:prefix]}/#{(Digest::MD5.hexdigest(params[:name]) + SecureRandom.uuid)}.#{params[:name].split('.').last}"
  end
end
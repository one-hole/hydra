# 用户模型。这里特指我们的「刷单商家」

=begin

  phone
  password

  has_one account

  用户应该有城市 - 同城匹配使用
  用户可以创建 充值订单 - ChargeOrder
  用户可以抢单 抢单订单 - RushOrder
  
=end

class User < ApplicationRecord

  has_secure_password

  has_one :account
  has_one :profile
  has_many :charge_orders
  has_many :rush_orders

  before_create do
    generate_token
    generate_account
    generate_profile
  end


  private

  def generate_token
    self.token = loop do
      token = SecureRandom.urlsafe_base64
      break token unless User.exists?(token: token)
    end
  end

  def generate_account
    build_account(coin: 0.0, frozen_coin: 0.0)
  end

  def generate_profile
    build_profile()
  end
end
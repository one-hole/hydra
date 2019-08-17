# 用户模型。这里特指我们的「刷单商家」

=begin

phone
password

has_one account
  
=end

class User < ApplicationRecord

  has_secure_password

  before_create do
    genenrate_token
  end


  private
    def genenrate_token
      
    end
end
# 用户账户

class Account < ApplicationRecord

  validates_numericality_of :coin,        greater_than_or_equal_to: 0.0
  validates_numericality_of :frozen_coin, greater_than_or_equal_to: 0.0

  belongs_to :user

  # freeze 函数使用的是标量
  def freeze(amount)
    self.with_lock { self.update(coin: self.coin - amount, frozen_coin: self.frozen_coin + amount) }
  end

  # unfreeze 函数使用的是标量
  def unfreeze(amount)
    self.with_lock { self.update(coin: self.coin + amount, frozen_coin: self.frozen_coin - amount) }
  end

  private
    # increase 函数使用的是矢量
    def increase(amount)
      self.with_lock { self.update(coin, self.coin + amount) }
    end
end

# 用户账户

class Account < ApplicationRecord

  validates_numericality_of :coin,        greater_than_or_equal_to: 0.0
  validates_numericality_of :frozen_coin, greater_than_or_equal_to: 0.0

  belongs_to :user

  def enough(amount)
    return coin >= amount
  end

  def charge(amount)
    increase(amount)
  end

  # freeze 函数使用的是标量
  def freeze(amount)
    with_lock { update(coin: coin - amount, frozen_coin: frozen_coin + amount) }
  end

  # unfreeze 函数使用的是标量
  def unfreeze(amount)
    with_lock { update(coin: coin + amount, frozen_coin: frozen_coin - amount) }
  end

  private

  # increase 函数使用的是矢量
  def increase(amount)
    with_lock { update(coin: (coin + amount)) }
  end
end

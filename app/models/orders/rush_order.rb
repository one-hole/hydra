# RushOrder 的创建
#   1. 校验 User 的账户余额、并且扣款
#   2. BcOrder 标注为被「待确认」
#   3. 创建 RushOrder
#   抢单 - 商家（用户）抢 BC 的单子

# Status

# 1. CREATED (已经创建)
# 2. CONFIRMED (已经确认) 1 -> 2 由商家确认（商家也就是我们的用户）

class RushOrder < ApplicationRecord

  belongs_to :user
  belongs_to :bc_order

  enum status: {
    "CREATED" => 1,
    "CONFIRMED" => 2
  }

  def self.build(user, bc_order)
    @rush_order = nil
    RushOrder.transaction do
      @rush_order = user.rush_orders.create(bc_order: bc_order)
      user.account.pay(bc_order.amount)
      bc_order.update(status: 2)
    end

    return @rush_order
  end
end

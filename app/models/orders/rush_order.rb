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

  delegate :account, to: :user
  delegate :amount,  to: :bc_order

  enum status: {
    "CREATED" => 1,
    "CONFIRMED" => 2
  }

  def self.build(user, bc_order)
    @rush_order = nil
    RushOrder.transaction do
      @rush_order = user.rush_orders.create(bc_order: bc_order)
      user.account.freeze(bc_order.amount)
      bc_order.update(status: 2, user: user)
    end

    @rush_order
  end

  # 用户（商家自行确认）
  # 解冻相应的数量 & 然后扣除相应的数量
  # 状态改变
  def confirm
    return false if (self.status != "CREATED")
    RushOrder.transaction do
      update(status: "CONFIRMED")
      bc_order.confirm    # 对应的 BcOrder 确认（后期抽成函数）
      account.unfreeze(amount)
      account.save
      account.reload
      account.pay(amount) # TODO（Details）& 奖励分
    end
  end
end

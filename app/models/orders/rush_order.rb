# RushOrder 的创建
#   1. 校验 User 的账户余额、并且扣款
#   2. BcOrder 标注为被「待确认」
#   3. 创建 RushOrder
#   抢单 - 商家（用户）抢 BC 的单子

# Status

# 1. CREATED (已经创建)
# 2.

class RushOrder < ApplicationRecord
  belongs_to :user
  belongs_to :bc_order

  enum status: {

  }

  def self.build(user, bc_order)
    RushOrder.transaction do

    end
  end
end

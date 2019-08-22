# 用户给平台充值

=begin

1. 已创建 - 用户发起需要充值的客观情况
2. 已打款 - 用户打完款之后点击已打款
3. 已确认 - （平台客服需要确认）

6. 已取消
=end

class ChargeOrder < ApplicationRecord

  enum status: {
    "CREATED" => 1,
    "PAID" => 2,
    "CONFIRMED" => 3,
    "CANCELED" => 6
  }

  belongs_to :user
  has_one :account_detail, as: :accountable

  delegate :account, to: :user

  include Admin::ChargeOrderConcern

end

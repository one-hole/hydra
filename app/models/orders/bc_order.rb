# BC 平台发过来的充值需求
=begin

  belongs_to :tenant
  belongs_to :user, optional

  金额
  BC平台单号
  我们平台单号
  地点(用字符串表示、暂时)

  状态:

  1. BC平台发过来、「已接收」
  2. 用户抢单成功、「待确认」
  3. 用户确认成功、「已完成」
  7. 用户取消、    「已取消」 - 这边暂时由用户取消、后期也可以是平台取消

=end
class BcOrder < ApplicationRecord

  enum status: {
    'ACCEPTED'  => 1,
    'PENDING'   => 2,
    'CONFIRMED' => 3
  }

  validates_numericality_of :amount, greater_than_or_equal_to: 0.0

  belongs_to :tenant
  belongs_to :user, optional: true

  def confirm
    update(status: 3)
    # TODO notify bc platform
  end
end

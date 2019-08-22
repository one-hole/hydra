module Admin
  module ChargeOrderConcern
    extend ActiveSupport::Concern

    included do
      # TODO 管理员确认用户的充值行为成功、这个行为会创建用户账户明细
      # 只有管理员有权限调用这个函数 & 目前仅在 APi 层加了管控
      # TODO 需要在模型层也加入管控
      def confirm
        AccountDetail.build(self, account, amount, user,'')
        update(status: ChargeOrder::statuses["CONFIRMED"])
      end
    end
  end
end

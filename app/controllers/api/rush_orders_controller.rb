module Api
  class RushOrdersController < BaseController

    before_action :authenticate

    # POST /rush_orders
    # 用户抢单「抢 BC平台分配过来的充值单、这里就是 创建 RushOrder 」
    def create
      load_bc_order
      check_account
      build_record
      render json:
        @record
    end

    private

    def check_account
      raise AccountRemainError unless current_user.account.enough(@bc_order.amount)
    end

    def load_bc_order
      @bc_order = BcOrder.find_by(id: params[:bc_id], status: 1)
      raise BcOrderNotFoundError unless @bc_order
    end

    def build_record
      @record = RushOrder.build(current_user, @bc_order)
    end
  end
end

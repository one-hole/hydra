module Api
  class RushOrdersController < BaseController

    # POST /rush_orders
    # 用户抢单「抢 BC平台分配过来的充值单、这里就是 创建 RushOrder 」
    def create
      render json: {
        "abc": "abc"
      }
    end

    private
      def load_bc_order
        @bcorder = BcOrder.find_by(id: params[:bc_id], status: 1)
        raise BcOrderNotFoundError unless @bcorder
      end
  end
end

module Api
  class RushOrdersController < BaseController

    # POST /rush_orders
    # 用户抢单「抢 BC平台分配过来的充值单、这里就是 创建 RushOrder 」
    def create
      render json: {
        "abc": "abc"
      }
    end

  end
end
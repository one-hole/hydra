module Api
  class RushOrdersController < BaseController

    before_action :authenticate

    # 进行中的 & 等待用户打款的
    def index
      load_records
      render json:
        @load_records, each_serializer: RushOrderIndexSerializer, root: 'data', meta: meta
    end

    # POST /rush_orders
    # 用户抢单「抢 BC平台分配过来的充值单、这里就是 创建 RushOrder 」
    def create
      load_bc_order
      check_account
      build_record
      render json:
        @record, status: 201
    end

    # 用户确认
    def update
      load_record
      confirm_record
      render json:
        @record, status: 201
    end

    private

    def load_records
      @load_records = current_user.rush_orders.includes(:bc_order).CREATED.page(current_page).per(per_size)
    end

    def confirm_record
      raise RushOrderConfirmError unless @record.confirm
    end

    def load_record
      @record = current_user.rush_orders.find_by(id: params[:id])
      raise RushOrderNotFoundError unless @record
    end

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

    def meta
      {
        current_page: current_page,
        per_size: 10,
        total_count: current_user.rush_orders.CREATED.count
      }
    end
  end
end

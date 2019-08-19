module Api
  class ChargesController < BaseController

    before_action :authenticate

    # 我的充值列表
    def index
      load_records
      render json:
        @records, each_serializer: ChargeCreateSerializer, root: 'data', meta: meta, status: 200
    end

    # 发起一个充值的单子
    def create
      build_record
      render json:
        @record, serializer: ChargeCreateSerializer, root: 'data', status: 201
    end

    # 确认一个充值的单子
    def update
      load_record
      confirm_record
      render json:
        @record, serializer: ChargeCreateSerializer, root: 'data', status: 201
    end

    # 取消一个充值的单子
    def destroy

    end

    private
      def charge_params
        params.fetch(:charges)
      end

      def build_record
        @record = current_user.charge_orders.create!(amount: charge_params[:amount])
        raise ChargeOrderBuildError unless @record
      end

      def load_record
        @record = current_user.charge_orders.find_by(id: params[:id])
        raise ChargeOrderNotFoundError unless @record
      end

      def confirm_record
        @record.update(status: ChargeOrder::statuses['PAIED'])
      end

      def load_records
        @records = current_user.charge_orders.where(status: ChargeOrder::statuses[params[:status]])
      end

      def meta
        {
          per_size:     per_size,
          current_page: current_page,
          total_count:  current_user.charge_orders.where(status: ChargeOrder::statuses[params[:status]]).count
        }
      end

  end
end

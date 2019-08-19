module Api
  class BcOrdersController < BaseController

    # GET /bc_orders - 这里也是用户进入 APP 的首页
    def index
      load_records
      render json:
        @records, each_serializer: BcOrderIndexSerializer, root: 'data', meta: meta
    end

    private
      def load_records
        @records ||= BcOrder.page(current_page).per(per_size)
      end

      def meta
        {
          current_page: current_page,
          total_count: BcOrder.count,
          per_size: per_size
        }
      end
  end
end

module Admin
  class ChargesController < BaseController

    def index; end

    def update
      load_record
      @charge.confirm
    end

    private
      def load_record
        @charge = ChargeOrder.find_by(id: params[:id])
      end
  end
end

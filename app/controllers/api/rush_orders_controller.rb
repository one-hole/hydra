module Api
  class RushOrdersController < BaseController
    def index
      render json: {
        "abc": "abc"
      }
    end
  end
end
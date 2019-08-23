module Api
  class RushOrderIndexSerializer < ActiveModel::Serializer
    attributes :id, :status, :created_at, :amount

    belongs_to :bc_order
  end
end

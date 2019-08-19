module Api
  class ChargeCreateSerializer < ActiveModel::Serializer
    attributes :id, :amount, :status
  end
end

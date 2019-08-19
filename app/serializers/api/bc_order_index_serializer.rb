module Api
  class BcOrderIndexSerializer < ActiveModel::Serializer
    attributes :id, :amount, :status
  end
end

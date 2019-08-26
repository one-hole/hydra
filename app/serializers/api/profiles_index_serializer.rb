module Api
  class ProfilesIndexSerializer < ActiveModel::Serializer
    attributes :id

    has_one :profile
    has_one :account

    class AccountSerializer < ActiveModel::Serializer
      attributes :id, :coin
    end
  end
end
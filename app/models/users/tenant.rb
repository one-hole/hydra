# 商户模型。这里特指「BC商户」

class Tenant < ApplicationRecord
  has_many :bc_orders
end

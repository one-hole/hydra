class CreateChargeOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :charge_orders do |t|
      t.references :user
      t.integer    :status, default: 1
      t.decimal    :amount, precision: 15, scale: 10
    end
  end
end

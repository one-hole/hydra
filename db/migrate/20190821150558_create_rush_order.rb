class CreateRushOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :rush_orders do |t|
      t.references :user
      t.references :bc_order
      t.integer    :status, default: 1

      t.timestamps
    end
  end
end

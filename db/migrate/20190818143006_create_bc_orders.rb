class CreateBcOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :bc_orders do |t|
      t.references :tenant
      t.references :user
      t.string     :bc_number
      t.string     :number
      t.decimal    :amount, precision: 15, scale: 10
      t.string     :city
      t.integer    :status, index: true  #TODO

      t.timestamps
    end

    add_index(:bc_orders, [:bc_number, :tenant_id], unique: true, name: 'idx_uniq_bc_tenant')
    add_index(:bc_orders, :number, unique: true, name: 'idx_bc_num')
    add_index(:bc_orders, :city, name: 'idx_bc_city')
  end
end

class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|

      t.string :name
      t.string :api_key
      t.text   :pub_key
      t.text   :public_rsa_key
      t.text   :private_rsa_key

      t.timestamps
    end

    add_index(:tenants, :api_key, unique: true, name: 'idx_tenant_key')
  end
end

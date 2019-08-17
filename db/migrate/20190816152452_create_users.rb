class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string      :name
      t.string      :phone
      t.string      :token
      t.string      :password_digest

      t.timestamps
    end

    add_index(:users, :token, unique: true, name: 'idx_user_token')
    add_index(:users, :phone, unique: true, name: 'idx_user_phone')
  end
end

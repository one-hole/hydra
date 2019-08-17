class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|

      t.references :user
      t.decimal    :coin          , :precision => 15, :scale => 10
      t.decimal    :frozen_coin   , :precision => 15, :scale => 10

      t.timestamps
    end
  end
end

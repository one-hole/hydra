class CreateAccountDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :account_details do |t|
      t.references :accountable, polymorphic: true
      t.decimal    :amount, precision: 15, scale: 10
      t.references :operateable, polymorphic: true
      t.string     :mark
      t.references :account
    end
  end
end

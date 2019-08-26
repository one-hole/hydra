class CreateProfile < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string  :wx
      t.string  :zfb
      t.string  :qq
      t.string  :jd
      t.string  :ysf
    end
  end
end
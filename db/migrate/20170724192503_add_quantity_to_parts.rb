class AddQuantityToParts < ActiveRecord::Migration[5.0]
  def change
    change_table :parts do |t|
      t.decimal :quantity
    end
  end

end

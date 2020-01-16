class AddCarriageToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :carriage, :boolean, default: false, null: false
  end
end

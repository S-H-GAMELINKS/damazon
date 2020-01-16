class AddCarriageToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :carriage, :boolean
  end
end

class AddIngredientesToHamburguesa < ActiveRecord::Migration[5.2]
  def change
    add_column :hamburguesas, :ingredientes, :text, default: [], array: true
  end
end

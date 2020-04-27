class AddPathToHamburguesa < ActiveRecord::Migration[5.2]
  def change
    add_column :hamburguesas, :path, :text
  end
end

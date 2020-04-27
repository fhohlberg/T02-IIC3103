class AddPathToIngrediente < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredientes, :path, :text
  end
end

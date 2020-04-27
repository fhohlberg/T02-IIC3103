class CreateHamburguesas < ActiveRecord::Migration[5.2]
  def change
    create_table :hamburguesas do |t|
      t.string :nombre
      t.string :precio
      t.string :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end

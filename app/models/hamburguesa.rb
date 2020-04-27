class Hamburguesa < ApplicationRecord
    
    has_many :hamburguesa_ingredientes, dependent: :destroy
    has_many :ingredientes, through: :hamburguesa_ingredientes
    validates :nombre, :precio, :descripcion, :imagen, presence: true
end

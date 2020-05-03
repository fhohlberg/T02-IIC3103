class Ingrediente < ApplicationRecord
    include Rails.application.routes.url_helpers
    
    has_many :hamburguesa_ingredientes, dependent: :destroy
    validates :nombre, :descripcion, presence: true

    
end

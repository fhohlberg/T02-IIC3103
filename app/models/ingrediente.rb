class Ingrediente < ApplicationRecord
    include Rails.application.routes.url_helpers
    
    has_many :hamburguesa_ingredientes, dependent: :destroy
    validates :id, :nombre, :descripcion, presence: true

    
end

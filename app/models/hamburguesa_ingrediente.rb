class HamburguesaIngrediente < ApplicationRecord

  validates_presence_of :hamburguesa, :ingrediente

  belongs_to :hamburguesa
  belongs_to :ingrediente
  
end
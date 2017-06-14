class Classroom < ApplicationRecord
  validates_presence_of :number
  validates :capacity, presence: true # mais um jeito de testar a mesma coisa,
                                      # vc pode usar a forma que preferir
end

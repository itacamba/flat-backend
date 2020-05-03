class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  has_many :rounds, dependent: :destroy
  has_many :words, through: :rounds
end

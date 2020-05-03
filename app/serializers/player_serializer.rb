class PlayerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :points
  has_many :player_rounds, dependent: :delete_all
  has_many :rounds, through: :player_rounds
end

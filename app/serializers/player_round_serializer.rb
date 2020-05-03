class PlayerRoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :round_id, :player_id, :role
  belongs_to :round
  belongs_to :player
end

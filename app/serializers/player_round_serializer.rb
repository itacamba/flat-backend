class PlayerRoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :round_id, :player_id, :role, :guesses
  belongs_to :round
  belongs_to :player
end

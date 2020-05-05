class RoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :game_id, :word_id, :round_in_progress, :guesses
  has_many :player_rounds, dependent: :delete_all
  has_many :players, through: :player_rounds, dependent: :destroy
  belongs_to :word
  belongs_to :game
  has_one :painting

end

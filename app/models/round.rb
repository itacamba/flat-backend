class Round < ApplicationRecord
    has_many :player_rounds, dependent: :delete_all
    has_many :players, through: :player_rounds, dependent: :destroy
    belongs_to :word
    belongs_to :game
end

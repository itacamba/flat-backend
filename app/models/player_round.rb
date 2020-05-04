class PlayerRound < ApplicationRecord
    belongs_to :round
    belongs_to :player 
    serialize :guesses , Array
end

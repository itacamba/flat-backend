class Player < ApplicationRecord
    has_many :player_rounds, dependent: :delete_all
    has_many :rounds, through: :player_rounds


end

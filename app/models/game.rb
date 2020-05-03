 class Game < ApplicationRecord
    has_many :rounds, dependent: :destroy
    has_many :words, through: :rounds
end

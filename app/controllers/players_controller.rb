class PlayersController < ApplicationController
    def index
        players = Player.all
        render json: players.to_json(include: :player_rounds)
    end
    def show
        player = Player.find(params[:id])
        render json: player.to_json(include: :player_rounds)
    end

    def create
        player = Player.create(name: params[:name])
        render json: player.to_json(include: :player_rounds)
    end

end

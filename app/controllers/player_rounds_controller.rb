class PlayerRoundsController < ApplicationController
    def index
        player_rounds = PlayerRound.all
        # render json: player_rounds.to_json(:include => {
        #     :round => {:only => [:name, :game_id, :word_id]},
        #     :player => {:only => [:name, :points]}
        # }, :except => [:created_at, :updated_at])
        options = {
            include: [:round , :'round.word', :'round.word.name']
        }
        
        render json: PlayerRoundSerializer.new(player_rounds, options) 
    end

    def show
        player_round = PlayerRound.find(params[:id])
        # render json: player_round.to_json(include: [:round, :player], :except => [:created_at, :updated_at])
        # render json: player_round.to_json(:include => {
        #     :round => {:only => [:name, :game_id, :word_id => {:only => [:name]}]},
        #     :player => {:only => [:name, :points]}
        # }, :except => [:created_at, :updated_at])
        # options = {
        #     include: [:player , :round, :'round.word']
        # }

        options = {
            include: [:player , :round, :'round.word', :'round.player_rounds.players', :'round.painting']
        }

        # byebug
        
        render json: PlayerRoundSerializer.new(player_round, options) 
    end

    def update
        
        # byebug
        p_round = PlayerRound.find(params[:id])
        p_round.update(role: params[:role])
    end

  


end

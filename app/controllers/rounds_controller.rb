class RoundsController < ApplicationController

    def index
        rounds = Round.all
        render json: rounds.as_json(include: :players)
    end
    
    def show
        round = Round.find(params[:id])
        render json: round.as_json(include: :player_rounds)
    end
    
    def endround
        
        #find round update :round_in_progress = false
        round = Round.find(params[:id])
        round.update(round_in_progress: false)
        #round update :number
        round.update(number: (round.number += 1))
        #round update :word
        new_word = Word.all.sample
        round.update(word: new_word)
        #find player and update :points, 
        player = Player.find(params[:player_id])
        player.update(points: (player.points +=1))
        #find all players for this round
        all_players_arr = PlayerRound.where(round_id: round.id)
       
       
        # Select all players that are not the current player, and map through array and change :role to "guesser"
        all_players_arr.select{|pr| pr.player_id != player.id}.map{|pr| pr.update(role: "blablabla")}
        # Find player round where player_id = to current player , and change :role to "drawer"
        all_players_arr.select{|pr| pr.player_id == player.id}.map{|pr| pr.update(role: "drawer")}
        
        drawer = PlayerRound.find_by(player_id: player.id, round_id: round.id)
    
        options = {
            include: [:player , :round, :'round.word', :'round.player_rounds.players']
        }
        #what to render to front end??
        render json: PlayerRoundSerializer.new(drawer, options) 

    end
end

class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games.as_json(include: :rounds, :except => [:created_at, :updated_at])
        # options = {
        #     include: :rounds
        # }
        # render json: GameSerializer.new(games, options) 
    end

    def show
        game = Game.find(params[:id])
        render json: game.as_json(include: :rounds, :except => [:created_at, :updated_at])
    end
    def create
       
        game = Game.create()
        word = Word.all.sample
        round = Round.create(number: 1, game_id: game.id, word_id: word.id)
        player = Player.find_or_create_by(name: params[:name])
        
        player_round = PlayerRound.find_or_create_by(player_id: player.id, round_id: round.id, role: "drawer")
        # render json: player_round.as_json(include: [:round, :player])

        options = {
            include: [:player , :round, :'round.word', :'round.player_rounds.players']
        }
        
        render json: PlayerRoundSerializer.new(player_round, options) 
    end

    def join
        
        #find game
        game = Game.find(params[:id])
        
        #find or create user
        player = Player.find_or_create_by(name: params[:name])
    
        #find or create last round of game
        if game.rounds.last.nil?
            #creates new round, if it doesn't exist
            @last_round = Round.create(number: 1, game_id: game.id, word_id: Word.all.sample)
            # when the last round is is no longer in progress
            # render html: "Sorry. Game appears to be over. Please come back with your friends and create a new game."
        else
            #gets the last round if it exists
            @last_round = game.rounds.last

        end
        
        #create player_round
        player_round = PlayerRound.find_or_create_by(player_id: player.id, round_id: @last_round.id, role: "guesser")
        
        options = {
            include: [:player , :round, :'round.word', :'round.player_rounds.players']
        }
        
        #what to render to front end??
        render json: PlayerRoundSerializer.new(player_round, options) 
    end
end

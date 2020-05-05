class RoundsController < ApplicationController

    def index
        rounds = Round.all
        render json: rounds.as_json(include: :players)
    end
    
    def show
        round = Round.find(params[:id])
        render json: round.as_json(include: :player_rounds)
    end

    # def endround
    #     round = Round.find(params[:id])
    #     player = Player.find(params[:player_id])
    #     player_round = PlayerRound.find(params[:player_round_id])
    #     byebug
        
    #     painting = round.painting
        
    #     #find all player_rounds for this round
    #     #update all player_rounds.role: "guesser" for all prs but  the player for this pr
    #     #update round.number:
    #     #
        
    # end
    
    def endround

        
        # byebug
        #find round update :round_in_progress = false
        round = Round.find(params[:id])
        round.update(round_in_progress: false)
        #round update :number
        round.update(number: (round.number += 1), guesses: round.guesses.clear())
        #round update :word
        new_word = Word.all.sample
        round.update(word: new_word)
        #find player and update :points, 
        player = Player.find(params[:player_id])
        player.update(points: (player.points +=1))
        #find all players for this round
        
        #this line finds the player round for the player who guessed Right
        drawer = PlayerRound.find_by(player_id: player.id, round_id: round.id)
        painting = Painting.find_by(round_id: round.id)
        painting.update(url: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAFKUlEQVR4Xu3VsRHDMAwEQbH/GlmL3YDl4NJf5Qiw4I3Ovffz+AgQ+ClwBOJlEHgXEIjXQeCPgEA8DwIC8QYINAF/kOZmakRAICOHtmYTEEhzMzUiIJCRQ1uzCQikuZkaERDIyKGt2QQE0txMjQgIZOTQ1mwCAmlupkYEBDJyaGs2AYE0N1MjAgIZObQ1m4BAmpupEQGBjBzamk1AIM3N1IiAQEYObc0mIJDmZmpEQCAjh7ZmExBIczM1IiCQkUNbswkIpLmZGhEQyMihrdkEBNLcTI0ICGTk0NZsAgJpbqZGBAQycmhrNgGBNDdTIwICGTm0NZuAQJqbqREBgYwc2ppNQCDNzdSIgEBGDm3NJiCQ5mZqREAgI4e2ZhMQSHMzNSIgkJFDW7MJCKS5mRoREMjIoa3ZBATS3EyNCAhk5NDWbAICaW6mRgQEMnJoazYBgTQ3UyMCAhk5tDWbgECam6kRAYGMHNqaTUAgzc3UiIBARg5tzSYgkOZmakRAICOHtmYTEEhzMzUiIJCRQ1uzCQikuZkaERDIyKGt2QQE0txMjQgIZOTQ1mwCAmlupkYEBDJyaGs2AYE0N1MjAgIZObQ1m4BAmpupEQGBjBzamk1AIM3N1IiAQEYObc0mIJDmZmpEQCAjh7ZmExBIczM1IiCQkUNbswkIpLmZGhEQyMihrdkEBNLcTI0ICGTk0NZsAgJpbqZGBAQycmhrNgGBNDdTIwICGTm0NZuAQJqbqREBgYwc2ppNQCDNzdSIgEBGDm3NJiCQ5mZqREAgI4e2ZhMQSHMzNSIgkJFDW7MJCKS5mRoREMjIoa3ZBATS3EyNCAhk5NDWbAICaW6mRgQEMnJoazYBgTQ3UyMCAhk5tDWbgECam6kRAYGMHNqaTUAgzc3UiIBARg5tzSYgkOZmakRAICOHtmYTEEhzMzUiIJCRQ1uzCQikuZkaERDIyKGt2QQE0txMjQgIZOTQ1mwCAmlupkYEBDJyaGs2AYE0N1MjAgIZObQ1m4BAmpupEQGBjBzamk1AIM3N1IiAQEYObc0mIJDmZmpEQCAjh7ZmExBIczM1IiCQkUNbswkIpLmZGhEQyMihrdkEBNLcTI0ICGTk0NZsAgJpbqZGBAQycmhrNgGBNDdTIwICGTm0NZuAQJqbqREBgYwc2ppNQCDNzdSIgEBGDm3NJiCQ5mZqREAgI4e2ZhMQSHMzNSIgkJFDW7MJCKS5mRoREMjIoa3ZBATS3EyNCAhk5NDWbAICaW6mRgQEMnJoazYBgTQ3UyMCAhk5tDWbgECam6kRAYGMHNqaTUAgzc3UiIBARg5tzSYgkOZmakRAICOHtmYTEEhzMzUiIJCRQ1uzCQikuZkaERDIyKGt2QQE0txMjQgIZOTQ1mwCAmlupkYEBDJyaGs2AYE0N1MjAgIZObQ1m4BAmpupEQGBjBzamk1AIM3N1IiAQEYObc0mIJDmZmpEQCAjh7ZmExBIczM1IiCQkUNbswkIpLmZGhEQyMihrdkEBNLcTI0ICGTk0NZsAgJpbqZGBAQycmhrNgGBNDdTIwICGTm0NZuAQJqbqREBgYwc2ppNQCDNzdSIgEBGDm3NJiCQ5mZqREAgI4e2ZhMQSHMzNSIgkJFDW7MJCKS5mRoREMjIoa3ZBATS3EyNCAhk5NDWbAICaW6mRgQEMnJoazYBgTQ3UyMCAhk5tDWbgECam6kRAYGMHNqaTUAgzc3UiIBARg5tzSYgkOZmakRAICOHtmYTEEhzMzUi8AXjrc4Xr9ys3wAAAABJRU5ErkJggg==")
       

        all_players_arr = PlayerRound.where(round_id: round.id)
    
        i = 0
        while i < all_players_arr.length do
            if all_players_arr[i].player_id != player.id
                all_players_arr[i].role = "guesser"
            else
                all_players_arr[i].role = "drawer"
            end
            i += 1
        end
        

        # Select all players that are not the current player, and map through array and change :role to "guesser"
        #all_players_arr.select{|pr| pr.player_id != player.id}.map{|pr| pr.update(role: "guesser")}
        # Find player round where player_id = to current player , and change :role to "drawer"
        # all_players_arr.select{|pr| pr.player_id == player.id}.map{|pr| pr.update(role: "drawer")}

        options = {
            include: [:player , :round, :'round.word', :'round.player_rounds.players', :'round.painting']
        }
        #what to render to front end??
        render json: PlayerRoundSerializer.new(drawer, options) 

    end


    def guesses
        
        round = Round.find(params[:id])
        round.update(guesses: round.guesses.push(params[:guess]) )
        # render json: round
    end
end

require 'faker'
Player.destroy_all
Game.destroy_all
Word.destroy_all
Round.destroy_all
PlayerRound.destroy_all
Painting.destroy_all



#PLAYERS
p1 = Player.create(name: "Betty")
p2 = Player.create(name: "John")
p3 = Player.create(name: "Mark")
p4 = Player.create(name: "Keith")
p5 = Player.create(name: "Laura")



#GAMES
game1 = Game.create()
game2 = Game.create()
game3 = Game.create()

# WORDS
w1 = Word.create(name: "popcorn", topic: "movie")
w2 = Word.create(name: "Kanye West", topic: "music")
w3 = Word.create(name: "banana", topic: "food")
w4 = Word.create(name: "cake", topic: "food")


 15.times do 
    Word.create(name: Faker::Creature::Animal.name, topic: "Animals" )
 end
 
 30.times do 
    Word.create(name: Faker::Food.fruits , topic: "Food" )
 end
 5.times do 
    Word.create(name: Faker::TvShows::GameOfThrones.character , topic: "Game of Thrones" )
 end
 15.times do 
    Word.create(name: Faker::Movies::HarryPotter.character  , topic: "Harry Potter" )
 end

 15.times do 
    Word.create(name:  Faker::TvShows::FamilyGuy.character  , topic: "Family Guy" )
 end
 10.times do 
    Word.create(name:  Faker::TvShows::Simpsons.character , topic: "The Simpsons" )
 end
 
 

#ROUNDS
r1 = Round.create(number: 1, game_id: game1.id, word_id: w1.id)
r2 = Round.create(number: 2, game_id: game1.id, word_id: w2.id)
r3 = Round.create(number: 3, game_id: game2.id, word_id: w3.id)
r4 = Round.create(number: 4, game_id: game3.id, word_id: w4.id)



# PLAYER ROUNDS
pr1 =PlayerRound.create( round_id: r1.id, player_id: p1.id, role: "guesser")
pr2 = PlayerRound.create( round_id: r1.id, player_id: p2.id, role: "guesser")
pr3 = PlayerRound.create( round_id: r1.id, player_id: p3.id, role: "guesser")
pr4 = PlayerRound.create( round_id: r1.id, player_id: p4.id, role: "drawer")
pr5 = PlayerRound.create( round_id: r2.id, player_id: p1.id, role: "drawer")
pr6 = PlayerRound.create( round_id: r2.id, player_id: p2.id, role: "guesser")
pr7 = PlayerRound.create( round_id: r2.id, player_id: p3.id, role: "guesser")
pr8 = PlayerRound.create( round_id: r2.id, player_id: p4.id, role: "guesser")
pr9 = PlayerRound.create( round_id: r3.id, player_id: p4.id, role: "guesser")
pr10 = PlayerRound.create( round_id: r3.id, player_id: p3.id, role: "guesser")
pr11 = PlayerRound.create( round_id: r3.id, player_id: p5.id, role: "guesser")
pr12 = PlayerRound.create( round_id: r3.id, player_id: p1.id, role: "drawer")
pr13 = PlayerRound.create( round_id: r4.id, player_id: p3.id, role: "guesser")
pr14 = PlayerRound.create( round_id: r4.id, player_id: p5.id, role: "guesser")
pr15 = PlayerRound.create( round_id: r4.id, player_id: p1.id, role: "guesser")
pr16 = PlayerRound.create( round_id: r4.id, player_id: p2.id, role: "drawer")







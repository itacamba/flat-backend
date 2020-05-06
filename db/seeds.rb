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
w4 = Word.create(name: "book of spells", topic: "Harry Potter")
w5 = Word.create(name: "cake", topic: "food")
w6 = Word.create(name: "treble clef", topic: "music")
w7 = Word.create(name: "Bad Boys", topic: "movie")
w8 = Word.create(name: "firebolt", topic: "Harry Potter")
w9 = Word.create(name: "Ruby", topic: "computers")
w10 = Word.create(name: "Javascript", topic: "computers")
w11 = Word.create(name: "laptop", topic: "computers")
w12 = Word.create(name: "chicken", topic: "food")
w13 = Word.create(name: "wizard", topic: "Harry Potter")
w14 = Word.create(name: "boom box", topic: "music")
# WORDSS






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







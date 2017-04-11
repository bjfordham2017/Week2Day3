enum Symbol {
    case x
    case o
}

struct Player : Equatable {
    var name: String
    var symbol: Symbol
    
    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.symbol == rhs.symbol
    }

}

func createPlayer(name: String, symbol: Symbol) -> Player? {
    let newPlayer = Player(name: name, symbol: symbol)
    if name.isEmpty == true {
        return nil
    } else {
        return newPlayer
    }
}

struct Game : Equatable {
    var playerOne: Player
    var playerTwo: Player
    var moves: [Move] = []
    
    public static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.playerOne == rhs.playerOne && lhs.playerTwo == rhs.playerTwo && lhs.moves == rhs.moves
    }
    
}


func createGame(firstPlayer: Player, secondPlayer: Player) -> Game? {
    let newGame = Game(playerOne: firstPlayer, playerTwo: secondPlayer, moves: [])
    if firstPlayer.symbol == secondPlayer.symbol {
        return nil
    } else {
        return newGame
    }
}

enum Location {
    case oneByOne
    case twoByOne
    case threeByOne
    case oneByTwo
    case twoByTwo
    case threeByTwo
    case oneByThree
    case twoByThree
    case threeByThree
}

struct Move : Equatable {
    var player: Player
    var location: Location
    
    public static func == (lhs: Move, rhs: Move) -> Bool {
        return lhs.player == rhs.player && lhs.location == rhs.location
    }

}

func play(player: Player, location: Location, game: Game) -> Game? {
    let newMove = Move(player: player, location: location)
    var newGame = game
    if game.moves.contains(Move(player: game.playerOne, location: location)) {
        return nil
    } else if game.moves.contains(Move(player: game.playerTwo, location: location)) {
        return nil
    } else if player != game.playerOne && player != game.playerTwo {
        return nil
    } else {
        newGame.moves.append(newMove)
    }
    return newGame
}

func symbol(location: Location, game: Game) -> Symbol? {
    if game.moves.contains(Move(player: game.playerOne, location: location)) {
        return game.playerOne.symbol
    } else if game.moves.contains(Move(player: game.playerOne, location: location)) {
        return game.playerOne.symbol
    } else {
        return nil
    }
}

func requestScore(of team: Team) -> Int {
    
}

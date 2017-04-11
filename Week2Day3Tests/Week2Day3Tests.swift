//
//  Week2Day3Tests.swift
//  Week2Day3Tests
//
//  Created by Brent Fordham on 4/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import XCTest
@testable import Week2Day3

class Week2Day3Tests: XCTestCase {
    
    func testCreatePlayer() {
        let result = createPlayer(name: "Player One", symbol: .x)
        let expected = Player(name: "Player One", symbol: .x)
        XCTAssertEqual(result, expected)
    }
    
    func testCreatePlayer2() {
        let result = createPlayer(name: "Player Two", symbol: .o)
        let expected = Player(name: "Player Two", symbol: .o)
        XCTAssertEqual(result, expected)
    }

    func testCreatePlayer3() {
        let result = createPlayer(name: "", symbol: .x)
        let expected: Player? = nil
        XCTAssertEqual(result, expected)
    }

    func testCreateGame() {
        let result = createGame(firstPlayer: Player(name: "Sarah", symbol: .x), secondPlayer: Player(name: "Rachel", symbol: .o))
        let expected = Game(playerOne: Player(name: "Sarah", symbol: .x), playerTwo: Player(name: "Rachel", symbol: .o), moves: [])
        XCTAssertEqual(result, expected)
    }
    
    func testCreateGame2() {
        let result = createGame(firstPlayer: Player(name: "Sarah", symbol: .x), secondPlayer: Player(name: "Rachel", symbol: .x))
        let expected: Game? = nil
        XCTAssertEqual(result, expected)
    }
    
    func testPlay() {
        let newPlayerOne = Player(name: "Sarah", symbol: .x)
        let newPlayerTwo = Player(name: "Rachel", symbol: .o)
        let currentGame = createGame(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        
        let result = play(player: newPlayerOne, location: .twoByTwo, game: currentGame!)
        let expected: Game? = Game(playerOne: newPlayerOne, playerTwo: newPlayerTwo, moves: [Move(player: newPlayerOne, location: .twoByTwo)])
        XCTAssertEqual(result, expected)
    }

    func testPlay2() {
        let newPlayerOne = Player(name: "Sarah", symbol: .x)
        let newPlayerTwo = Player(name: "Rachel", symbol: .o)
        let lastGame = createGame(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        let currentGame = play(player: newPlayerOne, location: .twoByTwo, game: lastGame!)
        
        let result = play(player: newPlayerTwo, location: .twoByTwo, game: currentGame!)
        let expected: Game? = nil
        XCTAssertEqual(result, expected)
    }
    
    func testPlay3() {
        let newPlayerOne = Player(name: "Sarah", symbol: .x)
        let newPlayerTwo = Player(name: "Rachel", symbol: .o)
        let lastGame = createGame(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        let currentGame = play(player: newPlayerOne, location: .twoByTwo, game: lastGame!)
        
        let result = play(player: Player(name: "Ferdinand", symbol: .o), location: .twoByTwo, game: currentGame!)
        let expected: Game? = nil
        XCTAssertEqual(result, expected)
    }
    
    func testSymbol() {
        let newPlayerOne = Player(name: "Sarah", symbol: .x)
        let newPlayerTwo = Player(name: "Rachel", symbol: .o)
        let lastGame = createGame(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        let currentGame = play(player: newPlayerOne, location: .twoByTwo, game: lastGame!)
        
        let result = symbol(location: .twoByTwo, game: currentGame!)
        let expected: Symbol = .x
        XCTAssertEqual(result, expected)
        
    }
    
    func testSymbol2() {
        let newPlayerOne = Player(name: "Sarah", symbol: .x)
        let newPlayerTwo = Player(name: "Rachel", symbol: .o)
        let lastGame = createGame(firstPlayer: newPlayerOne, secondPlayer: newPlayerTwo)
        let currentGame = play(player: newPlayerOne, location: .twoByTwo, game: lastGame!)
        
        let result = symbol(location: .threeByThree, game: currentGame!)
        let expected: Symbol? = nil
        XCTAssertEqual(result, expected)

    }


}

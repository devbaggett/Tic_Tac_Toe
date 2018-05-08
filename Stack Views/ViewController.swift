//
//  ViewController.swift
//  Stack Views
//
//  Created by Devin Baggett on 5/7/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var player = 1
    var winConditions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var game = [0,0,0,
                0,0,0,
                0,0,0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if game[sender.tag] == 0 {
            game[sender.tag] = player
            if player == 1 {
                sender.backgroundColor = UIColor.red
                winnerLabel.text = "Blue's turn"
            }
            else {
                sender.backgroundColor = UIColor.blue
                winnerLabel.text = "Red's turn"
            }
            player *= -1
            checkWin()
        }
    }
    
    func checkWin() {
        for condition in winConditions {
            let score = game[condition[0]] + game[condition[1]] + game[condition[2]]
            switch score {
            case 3: declareWinner("Red")
                //red wins
            case -3: declareWinner("Blue")
                //blue wins
            default:
                print("No winner yet")
            }
        }
    }
    
    func declareWinner(_ winner: String) {
        winnerLabel.text = "\(winner) wins!"
        game = [2,2,2,2,2,2,2,2,2]
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        for btn in buttons {
            btn.backgroundColor = UIColor.gray
        }
        player = 1
        winnerLabel.text = "Red's turn"
        game = [0,0,0,
                0,0,0,
                0,0,0]
    }
    
}
    



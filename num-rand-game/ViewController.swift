//
//  ViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 17.03.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var prevScoreLabel: UILabel!
    
    var prevScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){
        prevScoreLabel.text = "Previous Score: \(prevScore)"
    }
    
    func setUpButtons(){
        startGameButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        startGameButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        startGameButton.layer.cornerRadius = 15
    }

}


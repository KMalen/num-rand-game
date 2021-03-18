//
//  ViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 17.03.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prevScoreLabel: UILabel!
    
    var prevScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){
        prevScoreLabel.text = "Previous Score: \(prevScore)"
    }

}


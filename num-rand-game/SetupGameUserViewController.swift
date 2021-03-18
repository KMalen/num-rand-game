//
//  SetupGameUserViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 18.03.21.
//

import UIKit

class SetupGameUserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? GamePlayViewController {
            
            switch segue.identifier {
            case "easy":
                vc.givenTime = 2.5
            case "medium":
                vc.givenTime = 1.5
            case "unreal":
                vc.givenTime = 1.0
            default:
                break
            }
        }
    }
    
}

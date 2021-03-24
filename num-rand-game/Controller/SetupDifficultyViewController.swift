//
//  SetupGameUserViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 18.03.21.
//

import UIKit

class SetupDifficultyViewController: UIViewController {
    
    @IBOutlet weak var easyChooseButton: UIButton!
    @IBOutlet weak var mediumChooseButton: UIButton!
    @IBOutlet weak var hardChooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? GamePlayViewController {
            
            switch segue.identifier {
            case "easy":
                vc.difficulty = "easy"
                vc.givenTime = 3.0
            case "medium":
                vc.difficulty = "medium"
                vc.givenTime = 2.5
            case "hard":
                vc.difficulty = "hard"
                vc.givenTime = 3.0
            default:
                break
            }
        }
    }
    
    func setUpButtons(){
        easyChooseButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        easyChooseButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        easyChooseButton.layer.cornerRadius = 15
        
        hardChooseButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        hardChooseButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        hardChooseButton.layer.cornerRadius = 15
        
        mediumChooseButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        mediumChooseButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        mediumChooseButton.layer.cornerRadius = 15
    }
    
}

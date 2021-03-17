//
//  GamePlayViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 17.03.21.
//

import UIKit

class GamePlayViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var score = 0
    var firstNum = 0
    var secondNum = 0
    let minRand = 1
    let maxRand = 10
    
    var timeLeft: Float = 2.0
    var givenTime: Float = 2.0
    var progress: Float = 1.0
    var answer = false
    var timeStep: Float = 0.02
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGame()
        
    }
    

    @IBAction func trueDidTouch(_ sender: UIButton) {
        
    }
    
    @IBAction func falseDidTouch(_ sender: UIButton) {
    }
    
    func setupGame(){
        score = 0
        resetGame()
        gameLoop()
    }
    
    @objc func gameLoop(){
        timeLeft -= timeStep
        progress = timeLeft / givenTime
        progressView.setProgress(progress, animated: false)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeStep), target: self, selector: #selector(gameLoop), userInfo: nil, repeats: false)
        
        if timeLeft <= 0 {
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
    }
    
    func resetGame(){
        firstNum = Int(arc4random_uniform(UInt32(maxRand-minRand+1)))
        secondNum = Int(arc4random_uniform(UInt32(maxRand-minRand+1)))
        
        numLabel.text = "\(firstNum) > \(secondNum)"
        
        timeLeft = givenTime
        progress = 1.0
        progressView.setProgress(progress, animated: false)
    }
    
}
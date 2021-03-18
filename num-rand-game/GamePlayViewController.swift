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
    
    var firstExpr = [0,0]
    var secondExpr = [0,0]
    let arithmeticSigns = ["*", "-", "+", ":"]
    var signsForExpr = 0
    
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
        answer = true
        checkAnswerFromUserExpr()
    }
    
    @IBAction func falseDidTouch(_ sender: UIButton) {
        answer = false
        checkAnswerFromUserExpr()
    }
    
    func setupGame(){
        score = 0
        //resetGame()
        createExpr()
        gameLoop()
    }
    
    @objc func gameLoop(){
        timeLeft -= timeStep
        progress = timeLeft / givenTime
        progressView.setProgress(progress, animated: false)
        
        if timeLeft <= 0 {
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeStep), target: self, selector: #selector(gameLoop), userInfo: nil, repeats: false)
    }
    
    func resetGame(){
        firstNum = Int(arc4random_uniform(UInt32(maxRand-minRand+1)))
        secondNum = Int(arc4random_uniform(UInt32(maxRand-minRand+1)))
        
        numLabel.text = "\(firstNum) > \(secondNum)"
        
        timeLeft = givenTime
        progress = 1.0
        progressView.setProgress(progress, animated: false)
    }
    
    func createExpr(){
        for num in 0...1 {
            firstExpr[num] = Int(arc4random_uniform(UInt32(maxRand-minRand+1))) + 1
            secondExpr[num] = Int(arc4random_uniform(UInt32(maxRand-minRand+1))) + 1
        }
        
        signsForExpr = Int(arc4random_uniform(3))
        
        numLabel.text = "\(firstExpr[0]) \(arithmeticSigns[signsForExpr]) \(firstExpr[1]) > \(secondExpr[0]) \(arithmeticSigns[signsForExpr]) \(secondExpr[1])"
        
        timeLeft = givenTime
        progress = 1.0
        progressView.setProgress(progress, animated: false)
    }
    
    func checkAnswerFromUserExpr(){
        var firstExprAnswer = 0
        var secondExprAnswer = 0
        
        switch signsForExpr {
        case 0:
            firstExprAnswer = firstExpr[0] * firstExpr[1]
            secondExprAnswer = secondExpr[0] * secondExpr[1]
        case 1:
            firstExprAnswer = firstExpr[0] - firstExpr[1]
            secondExprAnswer = secondExpr[0] - secondExpr[1]
        case 2:
            firstExprAnswer = firstExpr[0] + firstExpr[1]
            secondExprAnswer = secondExpr[0] + secondExpr[1]
        case 3:
            firstExprAnswer = firstExpr[0] / firstExpr[1]
            secondExprAnswer = secondExpr[0] / secondExpr[1]
        default:
            break
        }
        
        if answer == (firstExprAnswer > secondExprAnswer) {
            score += 1
            scoreLabel.text = "Score: \(score)"
            createExpr()
        } else {
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
        
    }
    
    func checkAnswerFromUser(){
        if answer == (firstNum > secondNum) {
            score += 1
            scoreLabel.text = "Score: \(score)"
            resetGame()
        } else {
            performSegue(withIdentifier: "goToMainScreen", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMainScreen" {
            let destination = segue.destination as! ViewController
            destination.prevScore = score
        }
    }
    
}

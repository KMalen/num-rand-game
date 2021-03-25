//
//  ViewController.swift
//  num-rand-game
//
//  Created by Kiril Malenchik on 17.03.21.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var prevScoreLabel: UILabel!
    @IBOutlet weak var multiplayerButton: UIButton!
    
    var prevScore = 0
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var gameScores: [GameScore]?
    
    
    // init firestore
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpButtons()
        fetchScore()
    }

    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){
        addScore()
    }
    
    func setUpButtons(){
        startGameButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        startGameButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        startGameButton.layer.cornerRadius = 15
        
        multiplayerButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        multiplayerButton.layer.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        multiplayerButton.layer.cornerRadius = 15
    }
    
    // Fetch the data from Core Data to display
    func fetchScore(){
        do {
            self.gameScores = try context.fetch(GameScore.fetchRequest())
            
            if gameScores?.count != 0 {
                prevScore = Int(gameScores?[0].prev_score ?? 0)
            }
            DispatchQueue.main.async {
                self.prevScoreLabel.text = "Previous Score: \(self.prevScore)"
            }
        } catch {
            
        }
    }
    
    func addScore(){
        
        if gameScores?.count == 0 {
            let newGameScores = GameScore(context: self.context)
            newGameScores.prev_score = Int64(prevScore)
            
            do {
                try self.context.save()
            } catch {
                
            }
            self.fetchScore()
        } else {
            self.updateScore()
        }
    }
    
    func updateScore(){
        gameScores?[0].prev_score  = Int64(prevScore)
        
        do {
            try self.context.save()
        } catch {
            
        }
        
        self.fetchScore()
    }
    
    // add data func for firestore (firebase test func)
    func addData(){
        var ref: DocumentReference? = nil
        ref = db.collection("cities").addDocument(data: [
            "name": "Tokyo",
            "country": "Japan"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

}


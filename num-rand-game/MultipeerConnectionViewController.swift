////
////  MultipeerConnectionViewController.swift
////  num-rand-game
////
////  Created by Kiril Malenchik on 21.03.21.
////
//
//import UIKit
//import MultipeerConnectivity
//
//class MultipeerConnectionViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate, MCNearbyServiceAdvertiserDelegate {
//
//    var peerID: MCPeerID!
//    var mcSession: MCSession!
//    var mcAdvertiserAssistant: MCNearbyServiceAdvertiser!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        peerID = MCPeerID(displayName: UIDevice.current.name)
//        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
//        mcSession.delegate = self
//
//    }
//
//    @IBAction func hostButton(_ sender: Any) {
//    }
//
//    @IBAction func connectButton(_ sender: Any) {
//    }
//
//    @IBAction func playButton(_ sender: Any) {
//    }
//
//    // MARK: - Functions
//
//    func sendData(){
//
//    }
//
//}

//
//  MatchViewController.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/22/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    var match : Match?
    @IBOutlet weak var Team1: UITextField!
    @IBOutlet weak var score1Field: UITextField!
    @IBOutlet weak var score2Field: UITextField!
    @IBOutlet weak var team2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let match = match {
            Team1.text = match.equipo1
            team2.text = match.equipo2
            score1Field.text = match.score1
            score2Field.text = match.score2
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchSave(_ sender: UIBarButtonItem) {
        let MatchToSave = Match(equipo1: Team1.text!, equipo2: team2.text!, score1: score1Field.text!, score2: score2Field.text!)
        delegate?.saveMatch(MatchToSave)
        dismissMe()
    }
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        dismissMe()
    }
    
   var delegate: MatchViewControllerDelegate?
    
    func dismissMe() {
        /*The property presentingViewController property will contain a value
         if the view controller was presented via a modal segue*/
        if presentingViewController != nil {
            // was presented via modal segue
            dismiss(animated: true, completion: nil)
        } else {
            // was pushed onto navigation stack
            navigationController!.popViewController(animated: true)
        }
    }
}

protocol MatchViewControllerDelegate {
    func saveMatch(_ match: Match)
}

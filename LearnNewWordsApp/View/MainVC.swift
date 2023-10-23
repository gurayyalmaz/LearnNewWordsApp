//
//  ViewController.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 23.10.23.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func addAWordButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toAddAWordVC", sender: nil)
        
    }
    
    @IBAction func getAWordButtonClicked(_ sender: Any) {
    }
}


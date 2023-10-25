//
//  MeaningVC.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 24.10.23.
//

import UIKit

class MeaningVC: UIViewController {
    
    @IBOutlet weak var meaningLabel: UILabel!
    
    var takenID = UUID()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let wordModel = WordModelView().fetchItem(id: takenID)
        meaningLabel.text = wordModel.meaning
        
    }
    


}

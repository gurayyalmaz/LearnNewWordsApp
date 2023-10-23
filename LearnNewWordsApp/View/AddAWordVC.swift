//
//  AddAWordVC.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 23.10.23.
//

import UIKit

class AddAWordVC: UIViewController {

    @IBOutlet weak var inForeignLanguageText: UITextField!
    @IBOutlet weak var meaningText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if inForeignLanguageText.text != "" && meaningText.text != "" {
            let wordModel = WordModel(inForeignLanguage: inForeignLanguageText.text!, meaning: meaningText.text!, id: UUID())
            WordModelView().addData(model: wordModel)
            
            // alert
            let alert = UIAlertController(title: "Success", message: "Added new word", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel) { AlertAction in
                self.inForeignLanguageText.text = ""
                self.meaningText.text = ""
            }
            alert.addAction(okButton)
            self.present(alert, animated: true)
        } else {
            
            // alert
            let alert = UIAlertController(title: "Error", message: "Text a foreign word or meaning", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        
    }
    

}

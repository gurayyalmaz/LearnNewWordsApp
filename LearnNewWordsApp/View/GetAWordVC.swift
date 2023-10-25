//
//  GetAWordVC.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 25.10.23.
//

import UIKit

class GetAWordVC: UIViewController {

    @IBOutlet weak var askedWordLabel: UILabel!
    @IBOutlet weak var answerText: UITextField!
    
    var word = WordModel.init(inForeignLanguage: "", meaning: "", id: UUID())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        word = WordModelView().giveARandomWord()
        askedWordLabel.text = word.inForeignLanguage
        
    }
    
    
    @IBAction func okButtonClicked(_ sender: Any) {
        if answerText.text != "" {
            if word.meaning == answerText.text {
                let alert = UIAlertController(title: "Success", message: "Right answer", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .cancel) { alertAction in
                    self.answerText.text = ""
                    self.word = WordModelView().giveARandomWord()
                    self.askedWordLabel.text = self.word.inForeignLanguage
                }
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Opps", message: "Wrong answer", preferredStyle: .alert)
                let newWordButton = UIAlertAction(title: "New word", style: .cancel) { alertAction in
                    self.answerText.text = ""
                    self.word = WordModelView().giveARandomWord()
                    self.askedWordLabel.text = self.word.inForeignLanguage
                }
                let tryAgainButton = UIAlertAction(title: "Try again", style: .default) { alertAction in
                    self.answerText.text = ""
                }
                alert.addAction(newWordButton)
                alert.addAction(tryAgainButton)
                self.present(alert, animated: true)
            }
        } else {
            print("Text an answer please")
        }
    }
    
}

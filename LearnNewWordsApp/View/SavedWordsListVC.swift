//
//  SavedWordsListVC.swift
//  LearnNewWordsApp
//
//  Created by Gyuray Yalmaz on 24.10.23.
//

import UIKit

class SavedWordsListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var savedWordsListTV: UITableView!
    
    var words = [WordModel]()
    var selectedID = UUID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedWordsListTV.delegate = self
        savedWordsListTV.dataSource = self

        words = WordModelView().fetchData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataAndTableView), name: NSNotification.Name("new data added"), object: nil)
        
    }
    
    @objc func reloadDataAndTableView() {
        words = WordModelView().fetchData()
        savedWordsListTV.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMeaningVC" {
            let destinationVC = segue.destination as! MeaningVC
            destinationVC.takenID = selectedID
        }
    }
    
    // table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.row].inForeignLanguage
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedID = words[indexPath.row].id
        performSegue(withIdentifier: "toMeaningVC", sender: nil)
    }

}

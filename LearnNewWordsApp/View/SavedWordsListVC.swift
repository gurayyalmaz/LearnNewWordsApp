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

}

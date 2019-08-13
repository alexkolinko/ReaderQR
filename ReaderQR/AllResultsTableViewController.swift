//
//  AllResultsTableViewController.swift
//  ReaderQR
//
//  Created by Alexandr on 8/8/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class AllResultsTableViewController: UITableViewController {
    
    let realmManager = RealmManager()
    var resultsData: Results<DataList>!
    let identifireCell = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsData = self.realmManager.realm?.objects(DataList.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.resultsData.count != 0 else {return 0}
        return resultsData.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireCell, for: indexPath) as! ResultTableViewCell
        let resultData = resultsData[indexPath.row]
        cell.resultLabel.text = resultData.data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = resultsData[indexPath.row]
        launchApp(decodedURL: result.data)
    }
    
    func launchApp(decodedURL: String) {
        if let url = URL(string: decodedURL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

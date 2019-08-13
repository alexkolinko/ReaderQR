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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsData = self.realmManager.realm?.objects(DataList.self)
        print("COOOUUUNNNTTT: ", resultsData.count, resultsData[0].data, resultsData[1].data)
//        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.resultsData.count != 0 else {return 0}
        return resultsData.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResultTableViewCell
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

//
//  ScanResultViewController.swift
//  ReaderQR
//
//  Created by Alexandr on 8/8/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class ScanResultViewController: UIViewController, ScannerViewControllerDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show" {
            let destinationVC = segue.destination as! ScannerViewController
            destinationVC.delegate = self
        }
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    func fillTheLabelWith(info: String) {
        self.resultLabel.text = info
    }
}

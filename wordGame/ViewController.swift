//
//  ViewController.swift
//  wordGame
//
//  Created by West Kraemer on 7/1/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the strings from the file and assign them to a variable (that variable is an array)
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
                allWords = ["words did not load"]
        }
        
        func startGame() {
            title = allWords.randomElement()
            usedWords.removeAll(keepingCapacity: true)
            tableView.reloadData()
        }
        
    }


}


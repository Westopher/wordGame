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
        
        //😎
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        //get the strings from the file and assign them to a variable (that variable is an array)
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
                allWords = ["words did not load"]
        }
        
        startGame()
        
    }
        
        func startGame() {
            title = allWords.randomElement()
            usedWords.removeAll(keepingCapacity: true)
            tableView.reloadData()
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    //😎
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
    
    // this is what happens when user types in info and presses submit
    let submitAction = UIAlertAction(title: "Submit", style: .default) {
        [weak self, weak ac] action in
        guard let answer = ac?.textFields?[0].text else {return}
        self?.submit(answer)
    }
    
    //add the submit button for the alert controller
    ac.addAction(submitAction)

    //and finally, present this badboy for use
    present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        
    }
    
}


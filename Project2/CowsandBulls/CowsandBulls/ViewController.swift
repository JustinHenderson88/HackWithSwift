//
//  ViewController.swift
//  CowsandBulls
//
//  Created by Justin on 3/7/22.
//

import Cocoa

var answer = ""
var guesses = [String] ()

class ViewController: NSViewController, NSTableViewDataSource ,NSTableViewDelegate {
    @IBOutlet var guess: NSTextField!
    @IBOutlet var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitGuess(_ sender: Any) {
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    //returns the number of items in guesses array
    func numberOfRows(in tableView: NSTableView) -> Int {
        return guesses.count
    }
    
    //result calculation
    func result(for guess: String) -> String {
        var bulls = 0
        var cows = 0
        
        let guessLetters = Array(guess)
        let answerLetters = Array(answer)
        
        //loop through individual characters in guess array
        for (index, letter) in guessLetters.enumerated() {
            if letter == answerLetters[index]{
                bulls += 1
            } else if answerLetters.contains(letter) {
                cows += 1
            }
        }
        return "\(bulls)b \(cows)c"
    }
    
    //add viewFor method..checks title of column to determine what data to show
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
            guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
            if tableColumn?.title == "Guess" {
                // this is the "Guess" column; show a previous guess
                vw.textField?.stringValue = guesses[row]
            } else {
                // this is the "Result" column; call our new method
                vw.textField?.stringValue = result(for: guesses[row])
            }

            return vw
        }
    // make table rows unselectable
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
        }
    
    //Start new game. Method takes a player guess and clears the guess array when a new game is started
    func startNewGame(){
        guess.stringValue = ""
        guesses.removeAll()
        answer = ""
        
        //generate random numbers
        var  numbers = Array(0...9)
        numbers.shuffle()
        
        for _ in 0 ..< 4 {
            answer.append(String(numbers.removeLast()))
        }
        tableView.reloadData()
        }
    }


//
//  ViewController.swift
//  CowsandBulls
//
//  Created by Justin on 3/7/22.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var guess: NSTextField!
    @IBOutlet var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitGuess(_ sender: Any) {
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


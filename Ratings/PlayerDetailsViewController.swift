//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by RGP_KOREA on 2017. 1. 29..
//  Copyright © 2017년 DDRG. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!

    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    var player: Player?
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail" {
            guard let text = nameTextField.text, text.characters.isEmpty == false else {
                return
            }
            player = Player(name: nameTextField.text, game: game, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destination as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

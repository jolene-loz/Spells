//
//  ViewController.swift
//  Midterm2
//
//  Created by J. Lozano on 12/8/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var spells = Spells()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        spells.getSpells{
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
            let destination = segue.destination as! SpellDetailViewController
             if segue.identifier == "ShowSpell"{
                let selectedIndex = tableView.indexPathForSelectedRow!
                destination.spellData = spells.spellData[selectedIndex.row]   
            }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return spells.spellData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = spells.spellData[indexPath.row].name
        return cell
    }
}


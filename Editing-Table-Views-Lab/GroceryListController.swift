//
//  ViewController.swift
//  Editing-Table-Views-Lab
//
//  Created by Kelby Mittan on 11/21/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class GroceryListController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        
    }
    
    @IBAction func updateUIFromUnwindSegue(segue: UIStoryboardSegue) {
        print("adding event")
        
        guard let itemVC = segue.source as? AddItemViewController, let createdItem = itemVC.item else {
            fatalError()
        }
        
        items.insert(createdItem, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        listTableView.insertRows(at: [indexPath], with: .automatic)
    }


}

extension GroceryListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .insert:
            print("........")
        case .delete:
            items.remove(at: indexPath.row)
            listTableView.deleteRows(at: [indexPath], with: .fade)
        default:
            print(".......")
        }
    }
    
    
}


//
//  AddItemViewController.swift
//  Editing-Table-Views-Lab
//
//  Created by Kelby Mittan on 11/23/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var purchaseSwitch: UISwitch!
    
    var item: Item?
    
    var switchValue: Bool = true {
        // Property Observer - observs changes on a property
        didSet {
        // update switch label
            purchaseLabel.text = "\(purchaseSwitch.isOn ? "Purchased" : "Unpurchased")"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addItemTextField.delegate = self
        item = Item(itemName: "Poptart")
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        
        switchValue = sender.isOn
    }
    
}

extension AddItemViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        item?.itemName = textField.text ?? "No Item"
        return true
    }
}

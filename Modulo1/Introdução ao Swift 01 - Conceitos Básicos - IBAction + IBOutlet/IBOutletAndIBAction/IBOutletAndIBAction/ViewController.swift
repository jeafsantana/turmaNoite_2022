//
//  ViewController.swift
//  IBOutletAndIBAction
//
//  Created by Jessica Santana on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    
    @IBOutlet weak var mudarLabelButton: UIButton!
    
    var contagemDeGoodbyes: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloWorldLabel.text = "Goodbye World"
    }

    @IBAction func mudarTextoButtonAction(_ sender: Any) {
        helloWorldLabel.text = "Goodbye World \(contagemDeGoodbyes)"
        contagemDeGoodbyes = contagemDeGoodbyes + 1
    }
}


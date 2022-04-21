//
//  ViewController.swift
//  tableView_aula
//
//  Created by Jessica Santana on 20/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let arraySecoes = ["A", "B", "C", "D", "E", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" ****** Clicou na linha \(indexPath.row) da seçao \(indexPath.section) ******")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(" ****** A seçao que eu perguntei a quantidade de linhas foi \(section) ****** ")
        
        if section == 0 { return 1 }
        if section == 1 { return 4 }
        if section == 2 { return 2 }
        if section == 3 { return 6 }
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        
//        print("****** Entrei no método do cell for row at para perguntar qual o nome que vai ter na linha \(row) e na seçao \(section) ******")
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "Linha \(row) Seçao \(section)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
        return arraySecoes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 { return "A" }
//        if section == 1 { return "B" }
//        if section == 2 { return "C" }
//        if section == 3 { return "D" }
//
//        return ""        
        
        return arraySecoes[section]
    }
}

//
//  ViewController.swift
//  customCellTableViewProject
//
//  Created by Jessica Santana on 25/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    let nomes = ["Jessica", "Matheus", "Gabriela", "Anderson"]

    @IBOutlet weak var exemploTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exemploTableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellAmarela") as? CustomTableViewCell {
            cell.mudarNomeDaLabel(nome: nomes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}


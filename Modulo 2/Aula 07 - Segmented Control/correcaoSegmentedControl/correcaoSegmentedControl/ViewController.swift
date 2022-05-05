//
//  ViewController.swift
//  correcaoSegmentedControl
//
//  Created by Jessica Santana on 04/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var serHumanoTableView: UITableView!
    @IBOutlet weak var ProgramadorPessoaSegmentedControl: UISegmentedControl!
    
    let programadores: [SerHumano] = [
        SerHumano(
            foto: UIImage(named: "bill"),
            nome: "Bill Gates"
        )
    ]
    let pessoas: [SerHumano] = [
        SerHumano(
            foto: UIImage(named: "walt"),
            nome: "Walt Disney"
        )
    ]
    
    var listaParaTableView: [SerHumano] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaParaTableView = programadores
        
        serHumanoTableView.dataSource = self
    }
    
    @IBAction func mudouValorNoSegmentedControl(_ sender: Any) {
        let index = ProgramadorPessoaSegmentedControl.selectedSegmentIndex
        
        switch index {
        case 0: // caso programador
            listaParaTableView = programadores
            serHumanoTableView.reloadData()
        case 1: // caso pessoas
            listaParaTableView = pessoas
            serHumanoTableView.reloadData()
        default:
            break
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaParaTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "serHumanoCell") as? SerHumanoTableViewCell {
            cell.configuraCelula(
                serHumano: listaParaTableView[indexPath.row]
            )
            return cell
        }
        
        return UITableViewCell()
    }
}


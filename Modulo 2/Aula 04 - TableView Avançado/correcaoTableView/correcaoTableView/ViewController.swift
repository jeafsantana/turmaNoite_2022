//
//  ViewController.swift
//  correcaoTableView
//
//  Created by Jessica Santana on 25/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var dicionario: [String: [String]] = [
        "A": ["Amanda", "Alice", "Allison"],
        "B": ["Bruno", "Bárbara"]
    ]
    
    @IBOutlet weak var listaDeContatosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaDeContatosTableView.dataSource = self
    }

    private func getChaveFrom(position: Int) -> String {
        let chaves = Array(dicionario.keys)
        
        guard position < chaves.count else { return "" }
        
        return chaves[position]
    }
    
    private func getQuantidadeDeNomeDe(_ posicao: Int) -> Int {
        let chave = getChaveFrom(position: posicao)
        
        if let count = dicionario[chave]?.count {
            return count
        }

        return 0
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let linha = indexPath.row
        let section = indexPath.section
        
        let chave = getChaveFrom(position: section)
        
        dicionario[chave]?.remove(at: linha)
        listaDeContatosTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getQuantidadeDeNomeDe(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let linha = indexPath.row
        let section = indexPath.section
        
        let chave = getChaveFrom(position: section)
        
        if let nomes = dicionario[chave] {
            let nome = nomes[linha]
            
            let cell = UITableViewCell()
            cell.textLabel?.text = nome
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let chaves = Array(dicionario.keys)
        return chaves.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let chaves = Array(dicionario.keys)
        return chaves[section]
    }
}


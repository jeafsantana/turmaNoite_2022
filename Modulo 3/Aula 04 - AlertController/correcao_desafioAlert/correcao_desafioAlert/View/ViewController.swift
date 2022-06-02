//
//  ViewController.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 01/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filmesTableView: UITableView!
    
    let viewModel = FilmesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        filmesTableView.dataSource = self
        
        viewModel.buscaFilmes()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quantidadeDeFilmes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "filmeCell") as? FilmeTableViewCell {
                        
            let cellViewModel = viewModel.getCellViewModel(posicao: indexPath.row)
            
            cell.configure(viewModel: cellViewModel)
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: FilmesViewModelDelegate {
    func recarregaDados() {
        filmesTableView.reloadData()
    }
}

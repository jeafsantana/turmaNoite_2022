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
        
        filmesTableView.delegate = self
        filmesTableView.dataSource = self
        
        viewModel.buscaFilmes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetalheDoFilmeViewController {
            // let filme = sender as? Filme <- VM
            
            let posicaoSelecionada = sender as? Int
            
            destination.viewModel = viewModel.getDetalheDoFilmeViewModel(posicao: posicaoSelecionada)
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let filme = listaDeFilmes[indexPath.row]
        performSegue(withIdentifier: "irParaDetalheDoFilme", sender: indexPath.row)
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

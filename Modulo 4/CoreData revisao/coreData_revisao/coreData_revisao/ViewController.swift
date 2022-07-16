//
//  ViewController.swift
//  coreData_revisao
//
//  Created by Jessica Santana on 06/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var primeiraParteDaPiadaLabel: UILabel!
    @IBOutlet weak var segundaParteDaPiadaLabel: UILabel!
    
    @IBOutlet weak var piadasJaSorteadasTableView: UITableView!
    
    let viewModel = PiadasViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        piadasJaSorteadasTableView.delegate = self
        piadasJaSorteadasTableView.dataSource = self
        
        viewModel.delegate = self
        
        viewModel.carregarPrimeiraPiada()
    }
    
    @IBAction func sortearNovaPiadaButtonAction(_ sender: Any) {
        viewModel.sortearPiadaNova()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.exibirPiada(posicao: indexPath.row)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quantidadeDePiadas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getTitulo(posicao: indexPath.row)
        
        return  cell
    }
}

extension ViewController: PiadasViewModelDelegate {
    
    func exibePiadaSimples(descricaoDaPiada: String) {
        segundaParteDaPiadaLabel.isHidden = true
        primeiraParteDaPiadaLabel.text = descricaoDaPiada
    }
    
    func exibePiadaDupla(primeiraParteDaPiada: String, segundaParteDaPiada: String) {
        segundaParteDaPiadaLabel.isHidden = false
        
        primeiraParteDaPiadaLabel.text = primeiraParteDaPiada
        segundaParteDaPiadaLabel.text = segundaParteDaPiada
    }
    
    func recarregaDados() {
        piadasJaSorteadasTableView.reloadData()
    }
    
    func exibeAlertaDePiadaRepetida() {
        let alertVC = UIAlertController(
            title: "Piada Repetida!",
            message: "A piada solicitada já foi exibida",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                self.viewModel.sortearPiadaNova()
            }
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true)
    }
    
}


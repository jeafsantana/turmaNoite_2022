//
//  ViewController.swift
//  aula_CoreData
//
//  Created by Jessica Santana on 24/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    
    
    @IBOutlet weak var nomeEIdadeTableView: UITableView!
    
    let viewModel = PessoasViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeEIdadeTableView.dataSource = self
        viewModel.delegate = self
        
        viewModel.iniciouOAplicativo()
    }

    @IBAction func adicionarButtonAction(_ sender: Any) {
        
        // ao clicar em adicionar, eu vou querer
        // adicionar o nome concatenado com a idade
        // e exibir ele na tableview
        
        let nome = nomeTextField.text
        let idade = idadeTextField.text
        
        viewModel.adicionarPessoa(
            nome: nome,
            idade: idade
        )
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.quantidadeDePessoas()
        return viewModel.quantidadeDePessoas2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.pegarNomeEIdade(posicao: indexPath.row)
        
        return cell
    }
}

extension ViewController: PessoasViewModelDelegate {
    func atualizarLista() {
        nomeEIdadeTableView.reloadData()
    }
}


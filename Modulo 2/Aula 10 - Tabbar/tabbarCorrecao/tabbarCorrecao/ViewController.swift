//
//  ViewController.swift
//  tabbarCorrecao
//
//  Created by Jessica Santana on 11/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomesTableView: UITableView!
    
    let pessoas: [Pessoa] = [
        Pessoa(nome: "Jessica", altura: 1.72, idade: 26),
        .init(nome: "Adriano", altura: 1.67, idade: 20),
        Pessoa(nome: "Matheus", altura: 1.89, idade: 27),
        Pessoa(nome: "Camila", altura: 1.55, idade: 32)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomesTableView.dataSource = self
        nomesTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheDaPessoaVC = segue.destination as? DetalheDaPessoaViewController {
            if let pessoa = sender as? Pessoa {
                detalheDaPessoaVC.pessoa = pessoa
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // quando o usuário clicar na célula, eu vou querer enviar a pessoa selecionada para frente
        let pessoaSelecionada = pessoas[indexPath.row]
        
        print("O nome da pessoa selecionada é: \(pessoaSelecionada.nome)")
        
        performSegue(withIdentifier: "irParaDetalheDePessoa", sender: pessoaSelecionada)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = pessoas[indexPath.row].nome
        
        return cell
    }
}


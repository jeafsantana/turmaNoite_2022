//
//  ViewController.swift
//  MVC_aula
//
//  Created by Jessica Santana on 18/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    
    let servidor: Service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func okButtonAction(_ sender: Any) {
        verificarCPF(cpfTextField.text)
    }
    
    func verificarCPF(_ cpf: String?) {
        guard let cpf = cpf, cpf != "" else {
            atualizaTextFieldParaMostrarErro()
            return
        }
        
        let cliente = servidor.pegarClienteAPartirDe(cpf)
        
        if let cliente = cliente {
            removeTextFieldDeErro()
            atualizaDadosDoCliente(cliente)
        } else {
            atualizaTextFieldParaMostrarErro()
        }
    }
    
    private func atualizaDadosDoCliente(_ cliente: Cliente) {
        nomeLabel.text = cliente.nome
        idadeLabel.text = String(cliente.idade)
        saldoLabel.text = String(cliente.saldo)
    }
    
    func atualizaTextFieldParaMostrarErro() {
        cpfTextField.layer.borderColor = UIColor.red.cgColor
        cpfTextField.layer.borderWidth = 1
    }
    
    func removeTextFieldDeErro() {
        cpfTextField.layer.borderWidth = 0
    }
    
    
    func okButtonAction() {
        // quando o usuário clicou ok
        // ele quer saber qual os dados de nome, idade e saldo
        // de um certo cpf
        
        // entao, eu preciso perguntar para o oraculo quais os cpfs que eu conheço
        
        let cpf = cpfTextField.text ?? ""
        let cliente = servidor.pegarClienteAPartirDe(cpf)
        
        // verificar se o cpf fornecido está nos meus dados de cpf
        
        // se estiver, atualiza as labels com dados
        
        if let cliente = cliente {
            nomeLabel.text = cliente.nome
            idadeLabel.text = String(cliente.idade)
            saldoLabel.text = String(cliente.saldo)
        }
        
        // se nao, pinta o textfield de vermelho, para indicar
        // que o cpf nao é aceito
        
        if cliente == nil {
            cpfTextField.layer.borderColor = UIColor.red.cgColor
            cpfTextField.layer.borderWidth = 1
        }
        
        if cliente != nil {
            cpfTextField.layer.borderWidth = 0
        }
    }
    
}


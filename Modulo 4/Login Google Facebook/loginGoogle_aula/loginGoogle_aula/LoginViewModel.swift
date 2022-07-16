//
//  LoginViewModel.swift
//  loginGoogle_aula
//
//  Created by Jessica Santana on 15/07/22.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FacebookLogin

protocol LoginViewModelDelegate {
    func loginGoogle(configuration: GIDConfiguration)
}

class LoginViewModel {
    
    private let service: LoginService = .init()
    var delegate: LoginViewModelDelegate?
    
    func verificaUsuarioLogado() -> Bool {
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
    func efetuarLoginGoogle() {
        guard let configuration = service.pegarConfiguracaoGoogle() else { return }
        
        delegate?.loginGoogle(configuration: configuration)
    }
    
    func tratarLoginGoogle(user: GIDGoogleUser?, error: Error?) {
        // tratativa de erro
        if let error = error {
            print(error)
            return
        }
        
        // login do google deu certo
        salvarDadosNoFirebase(user: user)
        
        // User is signed in
       
        // fazer alguma coisa - delegate
    }
    
    func tratarLoginFacebook(result: LoginManagerLoginResult?, error: Error?) {
        service.tratarResultadoLoginFacebook(
            result: result,
            error: error
        )
    }
    
    private func pegarInformacoesDoUsuario() {
//        let currentUser = Auth.auth().currentUser
        
//        let email = currentUser?.email
//        let name = currentUser?.displayName
//        let photo = currentUser?.photoURL
    }
    
    private func salvarDadosNoFirebase(user: GIDGoogleUser?) {
        guard let credencial = service.pegarCredencialGoogle(de: user) else { return }
        
        service.salvarNoFirebase(com: credencial)
    }
}



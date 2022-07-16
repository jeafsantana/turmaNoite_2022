//
//  LoginService.swift
//  loginGoogle_aula
//
//  Created by Jessica Santana on 15/07/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FacebookLogin

class LoginService {
    
    func salvarNoFirebase(com credencial: AuthCredential) {
        
        Auth.auth().signIn(with: credencial) { authResult, error in
            if let error = error {
                print(error)
            }
            // ...
            return
        }
        
    }
    
    func tratarResultadoLoginFacebook(result: LoginManagerLoginResult?, error: Error?) {
        switch result {
            
        case .none:
            print("Um erro aconteceu")
        case .some(let loginResult):
            
            guard let token = loginResult.token?.tokenString else {
                return
            }
            
            let credencial = pegarConfiguracaoFacebook(
                token: token
            )
            
            salvarNoFirebase(com: credencial)
        }
    }
    
    func pegarConfiguracaoFacebook(token: String) -> AuthCredential {
        return FacebookAuthProvider.credential(
            withAccessToken: token
        )
    }
    
    func pegarCredencialGoogle(de user: GIDGoogleUser?) -> AuthCredential? {
        guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
        else {
            return nil
        }
        
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
        
        return credential
        
    }
    
    func pegarConfiguracaoGoogle() -> GIDConfiguration? {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return nil }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        return config
    }
    
}

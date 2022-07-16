//
//  ViewController.swift
//  loginGoogle_aula
//
//  Created by Jessica Santana on 13/07/22.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import FacebookCore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var FBButtonPositionView: UIView!
    
    let viewModel: LoginViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton(
            frame: .zero,
            permissions: [.publicProfile]
        )
        loginButton.center = FBButtonPositionView.center
        loginButton.delegate = self
        view.addSubview(loginButton)
        
        viewModel.delegate = self
    }
    
    @IBAction func loginGoogleButtonAction(_ sender: Any) {
        viewModel.efetuarLoginGoogle()
    }
    
}

extension ViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        viewModel.tratarLoginFacebook(
            result: result,
            error: error
        )
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("O usuário efetuou logout")
    }
}

extension ViewController: LoginViewModelDelegate {
    func loginGoogle(configuration: GIDConfiguration) {
        GIDSignIn.sharedInstance.signIn(
            with: configuration,
            presenting: self
        ) { [unowned self] user, error in
            self.viewModel.tratarLoginGoogle(
                user: user,
                error: error
            )
        }
    }
}





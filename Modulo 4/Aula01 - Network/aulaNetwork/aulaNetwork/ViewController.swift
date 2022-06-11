//
//  ViewController.swift
//  aulaNetwork
//
//  Created by Jessica Santana on 10/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        realizarRequisicaoDePiada()
    }
    
//https://v2.jokeapi.dev/joke/Any?safe-mode
    
    private func realizarRequisicaoDePiada() {
        
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
//            print("----- os dados \(data)")
            
            guard let data = data else {
                return
            }

            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
           
            print("----- o json convertido \(json)")
//            print("----- a response \(response)")
//            print("----- o error \(error)")
        }
        
        task.resume()
    }


}


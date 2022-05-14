//
//  ViewController.swift
//  correcaoGesture
//
//  Created by Jessica Santana on 13/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contadorLabel: UILabel!
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var longPressView: UIView!
    
    private var contador = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializaGestures()
    }
    
    private func inicializaGestures() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(tapAction(_:))
        )
        tapView.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(swipeAction(_:))
        )
        swipe.direction = .left
        
        swipeView.addGestureRecognizer(swipe)
        
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(longPressAction(_:))
        )
        longPress.minimumPressDuration = 3
        
        longPressView.addGestureRecognizer(longPress)
    }
    
    private func atualizaContadorCom(soma: Bool) {
//        if soma {
//            adicionaUmNoContador()
//        } else {
//            subtraiUmNoContador()
//        }
        
        soma ? adicionaUmNoContador() : subtraiUmNoContador()
        
        let stringContador = String(contador)
        contadorLabel.text = stringContador
    }
    
    private func adicionaUmNoContador() {
        contador += 1
//        contador = contador + 1
    }
    
    private func subtraiUmNoContador() {
        contador -= 1
        //        contador = contador - 1
    }
    
    @objc func tapAction(_ sender: UITapGestureRecognizer) {
        print("Tap")
        atualizaContadorCom(soma: true)
    }
    
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        print("Swipe")
        atualizaContadorCom(soma: false)
    }
    
    @objc func longPressAction(_ sender: UILongPressGestureRecognizer) {
        print("longPress")
        atualizaContadorCom(soma: true)
    }
    
    
}


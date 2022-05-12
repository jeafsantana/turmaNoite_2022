//
//  ViewController.swift
//  gestures
//
//  Created by Jessica Santana on 11/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewTapGesture: UIView!
    @IBOutlet weak var viewSwipeGesture: UIView!
    @IBOutlet weak var viewLongPressGesture: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(executaTap(_:))
        )
        viewTapGesture.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(executaSwipe(_:))
        )
        swipe.direction = .up
        viewSwipeGesture.addGestureRecognizer(swipe)
        
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(executaLongPress(_:))
        )
        longPress.minimumPressDuration = 3
        viewLongPressGesture.addGestureRecognizer(longPress)
    }

    @objc func executaTap(_ sender: UITapGestureRecognizer) {
        print("Tap")
    }
    
    @objc func executaSwipe(_ sender: UISwipeGestureRecognizer) {
        print("Swipe")
    }
    
    @objc func executaLongPress(_ sender: UILongPressGestureRecognizer) {
        print("Long Press")
    }

}


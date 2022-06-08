//
//  ViewController.swift
//  aula_imagepicker
//
//  Created by Jessica Santana on 06/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagePickerImageView: UIImageView!
    
    let viewModel = ImagePickerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func abrirImagePickerButtonAction(_ sender: Any) {
        abrirImagePickerVC()
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .camera
//        imagePicker.delegate = self
//
//        present(imagePicker, animated: true)
    }
    
    private func abrirImagePickerVC() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        let dic: [String: Int] = ["Jessica": 26]
//        let elemento = dic["Jessica"]
        
        if let image = info[.originalImage] as? UIImage {
            print("A imagem selecionada foi: \(image) ")
            imagePickerImageView.image = image
        }
        
        dismiss(animated: true)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Selecionou o botao de cancelar")
        dismiss(animated: true)
    }
    
}


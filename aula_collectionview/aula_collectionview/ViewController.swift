//
//  ViewController.swift
//  aula_collectionview
//
//  Created by Jessica Arruda Ferreira de Santana on 01/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movies: [Movie] = [.init(nomeImagem: "senhordosaneis.jpg", titulo: "Senhor dos Anéis"), Movie(nomeImagem: "startrek.jpg", titulo: "Star Trek"), Movie(nomeImagem: "starwars.jpg", titulo: "Star Wars"), Movie(nomeImagem: "matrix.jpeg", titulo: "Matrix"), Movie(nomeImagem: "capitao.jpg", titulo: "Capitão América - O primeiro Vingador"), Movie(nomeImagem: "homemdeferro.jpeg", titulo: "Homem de Ferro 2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].titulo)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell {
            cell.configure(with: movies[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}


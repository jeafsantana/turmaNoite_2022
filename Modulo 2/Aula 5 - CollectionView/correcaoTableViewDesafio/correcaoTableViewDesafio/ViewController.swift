//
//  ViewController.swift
//  correcaoTableViewDesafio
//
//  Created by Jessica Santana on 29/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filmesESeriesTableView: UITableView!
    
    let filmes: [Filme] = [
        Filme(
            poster: UIImage(named: "batman") ?? UIImage(),
            titulo: "Batman",
            genero: "açao"
        ),
        .init(poster: UIImage(named: "sonic") ?? .init(), titulo: "Sonic", genero: "Animaçao"),
        Filme(poster: UIImage(named: "morbius") ?? .init(), titulo: "Morbius", genero: "açao"),
        Filme(poster: UIImage(named: "uncharted") ?? .init(), titulo: "Uncharted", genero: "Aventura"),
        Filme(poster: UIImage(named: "doctorstrange") ?? .init(), titulo: "Doutor Estranho", genero: "Aventura"),
    ]
    
    let series: [Serie] = [
        Serie(poster: UIImage(named: "moonknight") ?? .init(), titulo: "Moon Knight"),
        Serie(poster: UIImage(named: "elite") ?? .init(), titulo: "Elite"),
        Serie(poster: UIImage(named: "flash") ?? .init(), titulo: "Flash"),
        Serie(poster: UIImage(named: "arrow") ?? .init(), titulo: "Arrow"),
        Serie(poster: UIImage(named: "strangerthings") ?? .init(), titulo: "Stranger Things")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        filmesESeriesTableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return filmes.count }
        if section == 1 { return series.count }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 { // filmes
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "filmeCell") as? FilmeTableViewCell  {
                let filme = filmes[row]
                
//                cell.configuraCelulaDoFilme(
//                    poster: filme.poster,
//                    tituloFilme: filme.titulo,
//                    generoFilme: filme.genero
//                )
                
                cell.configuraCelulaDoFilmeMelhorado(filme: filme)
                
                if row % 2 != 0 {
                    cell.backgroundColor = .red
                }
                
                return cell
            }
            
        }
        
        if section == 1 { // series
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "serieCell") as? SerieTableViewCell {
                let serie = series[row]
                
                cell.configuraCelulaSerie(
                    posterSerie: serie.poster,
                    tituloSerie: serie.titulo
                )
                
                if row % 2 != 0 {
                    cell.backgroundColor = .red
                }
                
                return cell
            }
            
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 { return "Filmes" }
        if section == 1 { return "Series" }
        
        return ""
    }
    
}


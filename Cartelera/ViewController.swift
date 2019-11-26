//
//  ViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 10/3/19.
//  Copyright © 2019 Abstergo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

     //--------------------------------------------------------------------------
    //Creacion de las 15 películas
    var peliculas: [Pelicula] = [
        //Pelicula(poster: "lol", titulo: "LOL", horarios: ["11:00", "15:30"], costo: 60.00, sala: "Sala 3", lugares: []),
        //Pelicula(poster: "gato", titulo: "Gato", horarios: ["12:00", "16:30"], costo: 60.00, sala: "Sala 5", lugares: []),
        Pelicula(poster: "CapMarvel", titulo: "Capitana Marvel", horarios: ["08:00", "20:00"], costo: 100.00, sala: "Sala 1", lugares: []),
        Pelicula(poster: "endgame", titulo: "Avengers: Endgame", horarios: ["13:00", "15:45"], costo: 60.00, sala: "Sala 2", lugares: []),
        Pelicula(poster: "Hobbit", titulo: "El Hobbit: Una Secuela Inesperada", horarios: ["11:30", "14:00"], costo: 70.00, sala: "Sala 5", lugares: []),
        Pelicula(poster: "InfinityWar", titulo: "Avengers", horarios: ["12:15", "18:00"], costo: 80.00, sala: "Sala 4", lugares: []),
        Pelicula(poster: "SpiderMan", titulo: "Spider-Man: Far From Disney", horarios: ["10:00", "15:45"], costo: 60.00, sala: "Sala 1", lugares: []),
        Pelicula(poster: "taken", titulo: "Busqueda Implacable 4: Ya Mejor Quédensela", horarios: ["12:40", "17:00"], costo: 60.00, sala: "Sala 3", lugares: []),
        Pelicula(poster: "miserables", titulo: "Les Misérables 2: Aún Son Miserables", horarios: ["7:00", "8:00", "23:00"], costo: 120.00, sala: "Sala 4", lugares: []),
        Pelicula(poster: "thesocialnetwork", titulo: "The Social Network 2: Tumblr", horarios: ["12:00", "15:30"], costo: 60.00, sala: "Sala 3", lugares: []),
        Pelicula(poster: "pulp_fiction", titulo: "Tiempos Violentos 2: ", horarios: ["14:45", "22:00"], costo: 80.00, sala: "Sala 1", lugares: []),
        Pelicula(poster: "Petroleo Sangriento", titulo: "Petroleo Sangriento 2: Chapopote Manchado", horarios: ["11:15", "13:20"], costo: 60.00, sala: "Sala 2", lugares: []),
        Pelicula(poster: "Divergent", titulo: "Divergente 4: Edición 'Juegos del Hambre'", horarios: ["15:00", "17:00", "20:00"], costo: 70.00, sala: "Sala 4", lugares: []),
        Pelicula(poster: "origen", titulo: "El Origen 2: El Cominezo", horarios: ["12:00", "15:30"], costo: 60.00, sala: "Sala 3", lugares: []),
        Pelicula(poster: "Planet", titulo: "El Inicio del Amanecer del Comienzo del Planeta de los Simios: Origenes", horarios: ["14:30", "16:15"], costo: 80.00, sala: "Sala 5", lugares: []),
        Pelicula(poster: "Guason", titulo: "El Bromas", horarios: ["12:30", "13:45"], costo: 80.00, sala: "Sala 3", lugares: []),
        Pelicula(poster: "sonic", titulo: "Sonic", horarios: ["15:00", "17:30"], costo: 60.00, sala: "Sala 2", lugares: [])
    ]
    //--------------------------------------------------------------------------
    
    var total: [Ticket] = [
        Ticket(pelicula: "", ticket: [0], subtotal: 0.00, horario: "")
    ]
    
    @IBOutlet weak var cartelera: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peli", for: indexPath) as! PeliculaCollectionViewCell
        
        cell.backgroundColor = .cyan
        
        cell.poster.image = UIImage(named: peliculas[indexPath.item].poster)
        cell.titulo.text = peliculas[indexPath.item].titulo
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segundaVista = segue.destination as! SecondViewController
        
        let myIndexPath = cartelera.indexPathsForSelectedItems
        
        segundaVista.pelicula = peliculas[(myIndexPath?.first?.item)!]
        
        segundaVista.totalSV = total
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    

}


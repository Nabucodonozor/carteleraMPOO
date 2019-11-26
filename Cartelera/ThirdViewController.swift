//
//  ThirdViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 Abstergo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var asientos: [Bool] = Array(repeating: false, count: 30)
    
    var peliculaTV: Pelicula!
    
    var guardado: [Int] = []
    
    var seleccionTotal: [Array<Int>] = []
    
    @IBOutlet weak var tituloPeli: UILabel!
    
    @IBOutlet weak var butacas: UICollectionView!
    
    @IBOutlet weak var seleccion: UILabel!
    
    var totalTV: [Ticket]!
    
    var diaTV: String!
    var horaTV: String!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        seleccion.text = "Asientos seleccionados: -ninguno-"
        
        tituloPeli.text = peliculaTV.titulo
        
        totalTV[totalTV.count-1].pelicula = peliculaTV.titulo
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "butaca", for: indexPath) as! SalaCollectionViewCell
        
        cell.backgroundColor = .cyan
        
        cell.imagen.image = UIImage(named: "asiento-de-cine")
        //Icon made by Freepik from www.flaticon.com
        
        cell.numero.text = "\(indexPath.item + 1)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("IndexPath: \(indexPath.item)")

        if asientos[indexPath.item] == false {
            asientos[indexPath.item] = true
            guardado.append(indexPath.item)
        }else{
            asientos[indexPath.item] = false
            var i: Int = 0
            while guardado[i] != indexPath.item {
                i = i + 1
            }
            guardado.remove(at: i)
        }
        
        print("Asientos: \(asientos)")
        
        var seleccionReal: [Int] = guardado
        
        var j = 0
        while j < guardado.count{
            seleccionReal[j] = guardado[j] + 1
            j = j + 1
        }
        
        seleccionReal = seleccionReal.sorted()
        
        print("Guardado: \(guardado)")
        print("Guardado.sorted: \(guardado.sorted())")
        print("Guardado.count: \(guardado.count)")
        
        seleccion.text = "Asientos seleccionados: \(seleccionReal)"
        
        if totalTV[0].horario != "" {
            totalTV.append(Ticket(pelicula: peliculaTV.titulo, ticket: seleccionReal, subtotal: Float(totalTV[totalTV.count-1].ticket.count) * peliculaTV.costo, horario: ""))
        }else{
            totalTV[totalTV.count-1].ticket = seleccionReal
            
            totalTV[totalTV.count-1].subtotal = Float(totalTV[totalTV.count-1].ticket.count) * peliculaTV.costo
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cuartaVista = segue.destination as! FourthViewController
        
        cuartaVista.totalFV = totalTV
        
        cuartaVista.diaFV = diaTV
        cuartaVista.horaFV = horaTV
    }
    
    @IBAction func aceptar(_ sender: Any) {
        
    }
    
    @IBAction func cerrar(_ sender: UIButton) {
        print("bye x2")
        dismiss(animated: true, completion: nil)
    }
    
}

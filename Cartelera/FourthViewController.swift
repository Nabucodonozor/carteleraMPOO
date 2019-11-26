//
//  FourthViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 11/6/19.
//  Copyright © 2019 Abstergo. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*
    var tic: [Ticket] = [
        Ticket(pelicula: "LOL", ticket: [1,2,3], subtotal: 160)
        ]*/
    
    var totalFV: [Ticket]!
    
    @IBOutlet weak var boletos: UITableView!
    
    var diaFV: String!
    var horaFV: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalFV.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TicketsTableViewCell
        
        cell.tickets.text = "\(totalFV[totalFV.count-1].ticket)"
        cell.subtotal.text = "$\(totalFV[totalFV.count-1].subtotal)"
        cell.pelicula.text = totalFV[totalFV.count-1].pelicula
        
        cell.horario.text = "\(diaFV ?? "") | \(horaFV ?? "")"
 
        //cell.pelicula.text = "Película: \(totalFV[0].pelicula)\n\tAsientos: \(totalFV[0].ticket)\n\tSubtotal: \(totalFV[0].subtotal)"
        
        print("\(totalFV[0].ticket)")
        
        //cell.backgroundColor = .gray
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quintaVista = segue.destination as! FifthViewController
        
        quintaVista.totalFiV = totalFV
        
    }


}

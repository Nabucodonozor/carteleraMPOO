//
//  FifthViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 11/22/19.
//  Copyright © 2019 Abstergo. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    var totalFiV: [Ticket]!

    @IBOutlet weak var final: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var t: Int = 0
        var s: Float = 0
        for i in 0...totalFiV.count-1 {
            t = t + totalFiV[i].ticket.count
            s = s + totalFiV[i].subtotal
        }
        
        final.text = "Transaccion exitosa,\n\tusted adquirió un total de \(t) boletos\n\n\tTOTAL: $\(s)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let primeraVista = segue.destination as! ViewController
        
        primeraVista.total = totalFiV
    }

}

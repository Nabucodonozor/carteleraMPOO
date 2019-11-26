//
//  SecondViewController.swift
//  Cartelera
//
//  Created by 2020-1 on 10/4/19.
//  Copyright © 2019 Abstergo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var horarios: UIPickerView!
    @IBOutlet weak var costo: UILabel!
    
    var pelicula: Pelicula!
    
    var dias: [String] = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
    
    var dia: String = ""
    var hora: String = ""
    
    var totalSV: [Ticket]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        poster.image = UIImage(named: pelicula.poster)
        titulo.text = pelicula.titulo

        costo.text = "Costo: $\(pelicula.costo)"
        // Do any additional setup after loading the view.
        
        horarios.dataSource = self
        horarios.delegate = self
        
        dia = dias[0]
        hora = pelicula.horarios[0]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dias.count
        }else{
            return pelicula.horarios.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dias[row]
        }else{
            return pelicula.horarios[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            dia = dias[row]
        }else{
            hora = pelicula.horarios[row]
        }
        
        print("Funcion seleccionada el dia \(dia) a las \(hora)")
    }
    
    @IBAction func comprar(_ sender: Any) {
        print("Boleto comprado para: \(dia) a las \(hora)")
    }
    
    @IBAction func cerrar(_ sender: UIButton) {
        print("bye")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let terceraVista = segue.destination as! ThirdViewController
        
        terceraVista.peliculaTV = pelicula
        
        terceraVista.totalTV = totalSV
        
        terceraVista.diaTV = dia
        terceraVista.horaTV = hora
    }
    
}

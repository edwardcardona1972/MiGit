//
//  ViewController.swift
//  TableViews
//
//  Created by Eduard Alexis Cardona Grajales on 17/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    private let myCountries = ["España", "México", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TableView.dataSource = self
        TableView.delegate = self  // protocolo delegado que va a recoger eventos
        
        TableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")  //de esta forma nuestra tabla lo que entiede es alguna celda de las que puede pintar es tipo MyCustomTableViewCell
    }
    

}
// MARK:- UITableBArItem!

extension ViewController: UITableViewDataSource {
    //con esta funcion creamos la cabezera
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas custom"// hasta aca la creacion de la cabezera
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer simples"
        }
        return "Foorter para celda custom"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
        
    }
    // Aca creamos una nueva sección
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }//para crear celdas de altura dinamica
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ TableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            var cell = TableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20) // podemos crear mas actuaciones como colo, tamaño...
                cell?.accessoryType = .disclosureIndicator // para q la celda nos marque >
                
                // en esta parte podemos agregar a la celdas lo que deseemos, como tamaño,color de cada celda
            }
            
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
        let cell = TableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as?
        MyCustomTableViewCell
            
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell!.mySecondLabel.text = myCountries[indexPath.row]
        return cell!
            }
    
    
    
}
//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // esta operacion se llama cada q hacemos un ckic
        
        print(myCountries[indexPath.row]) // vamos a imprimir la fila y con myCountries ya veremos los nombres
        
        
    }
    
}








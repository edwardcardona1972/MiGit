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
        TableView.tableFooterView = UIView()  // con esta linea no nos aparecen mas celdas vacias debajo de lo escrito
        
    }


}
// MARK:- UITableBArItem!

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
        
    }
    
    func tableView(_ TableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = TableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
            cell?.backgroundColor = .systemGray
            cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20) // podemos crear mas actuaciones como colo, tamaño...
            cell?.accessoryType = .disclosureIndicator // para q la celda nos marque >

            // en esta parte podemos agregar a la celdas lo que deseemos, como tamaño,color de cada celda
            
        }
       
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
    
    
}
//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // esta operacion se llama cada q hacemos un ckic
        
        print(myCountries[indexPath.row]) // vamos a imprimir la fila y con myCountries ya veremos los nombres
        
        
    }
    
}








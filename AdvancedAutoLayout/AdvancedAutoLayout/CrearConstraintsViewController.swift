//
//  CrearConstraintsViewController.swift
//  AdvancedAutoLayout
//
//  Created by Eduard Alexis Cardona Grajales on 21/2/25.
//

import UIKit

class CrearConstraintsViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Cosntraints de tamaño programaticamente altura y acnchura
        
        yellowView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // COnstraints de posición programaticamente
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints con respecto a su contenedor
        
        view.addConstraint(NSLayoutConstraint(item: yellowView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1000, constant: 16))
        
        yellowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
    

    

}

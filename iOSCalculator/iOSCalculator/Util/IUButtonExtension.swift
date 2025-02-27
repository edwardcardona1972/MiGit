//
//  IUButtonExtension.swift
//  iOSCalculator
//
//  Created by Eduard Alexis Cardona Grajales on 26/2/25.
//

import UIKit
private let orange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    


extension UIButton {
    
    // Borde redondo
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // Brilla
        func shine() {
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 0.5
            }) { (completion) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.alpha = 1
                })
            }
        }
    //Aparienciaselección boton de operación
    func selectedOperation(_ selected: Bool) {
        backgroundColor = selected ? .white : .orange
        setTitleColor(selected ? orange : .white, for: .normal)
    }
}

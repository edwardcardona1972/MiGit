//
//  Automovil.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 19/2/25.
//

import Foundation
 class Automovil{
    
    var color: String
    let numeroDeLlantas: Int
    var precio: Int
    let tipoAutomovil: TipoDeAutomovil
    
    init(color: String, numeroDeLlantas: Int, precio: Int, tipoAutomovil: TipoDeAutomovil = .normal) {
        self.color = color
        self.numeroDeLlantas = numeroDeLlantas
        self.precio = precio
        self.tipoAutomovil = tipoAutomovil
    }
    
    func encender() -> Bool{
        return true
    }
    
    func apagar() -> Bool{
        return false
    }
    
    func acelerar()->String{
        return "Aceleración exitosa"
    }
    
}

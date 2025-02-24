//
//  Automovil.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 19/2/25.
//

import Foundation
class Automovil{
    
    var color = "Azul"
    var numeroDeLlantas = 4
    var precio = 5000
    var tipoAutomovil: TipoDeAutomovil = .normal
    
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

enum TipoDeAutomovil: String{
    case normal
    case electrico
}

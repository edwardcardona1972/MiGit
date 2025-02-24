//
//  ViewControllerSegundaPantalla.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 19/2/25.
//

import UIKit

class ViewControllerSegundaPantalla: UIViewController {
    
    
    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var tipoAutomovil: TipoDeAutomovil!
    var automovilNormal:Automovil?
    var autoElectrico:AutomovilElectrico?
    var estadoAutomovil = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tipoAutomovil! {
        case .normal:
            automovilNormal = Automovil(color: "Azul", numeroDeLlantas: 4, precio: 50000)
            imagenView.image = UIImage(named: "automovil")
            label.text = "Se creo el automovil correctamente"
            
            
        case .electrico:
            autoElectrico = AutomovilElectrico(color: "Azul", numeroDeLlantas: 4, precio: 55000)
            imagenView.image = UIImage(named: "autoelectrico")
            autoElectrico!.color = "Azul"
            autoElectrico!.precio = 10000
            label.text = "Se creo el atimovil eléctrico correctamente"
        }
    }
    
    
    @IBAction func mostrarInformacion(_ sender: Any) {
        
        switch tipoAutomovil! {
        case .normal:
            label.text = """
                        El automovil tiene 
                        \(automovilNormal!.numeroDeLlantas) llantas, es de color \(automovilNormal!.color), su precio es de \(automovilNormal!.precio) Euros 
                        """
            
        case .electrico:
            label.text = """
                        El automovil tinen
                        \(autoElectrico!.numeroDeLlantas) llantas, es de color \(autoElectrico!.color), su precio es de \(autoElectrico!.precio) Euros, \
                         su carga esta al \(autoElectrico!.porcentajeBatería) de bateria 
                       """
        }
    }
    
    @IBAction func encender(_ sender: Any) {
        
        switch tipoAutomovil! {
        case .normal:
            if (estadoAutomovil){
                estadoAutomovil = automovilNormal!.encender()
                label.text = "El automovil se encendio correctamente"
            }else {
                label.text = "El automovil ya esta encendido"
            }
            
        case .electrico:
            if (estadoAutomovil){
                estadoAutomovil = autoElectrico!.encender()
                label.text = "El automovil electrico se encendio correctamente"
                autoElectrico!.porcentajeBatería = 95
            }else {
                label.text = "El automovil electrico ya esta encendido"
            }
        }
    }
    
    @IBAction func apagar(_ sender: Any) {
        switch tipoAutomovil! {
        case .normal:
            if (estadoAutomovil){
                estadoAutomovil = automovilNormal!.apagar()
                label.text = "El automovil se apagó correctamente"
            }else {
                label.text = "El automovil ya esta apagado"
            }
            
        case .electrico:
            if (estadoAutomovil){
                estadoAutomovil = autoElectrico!.apagar()
                label.text = "El automovil electrico se apagó correctamente"
                
            }else {
                label.text = "El automovil electrico ya esta apagado"
            }
        }
        
    }
    
    @IBAction func acelerar(_ sender: Any) {
        switch tipoAutomovil! {
        case .normal:
            if (estadoAutomovil){
                label.text = automovilNormal!.acelerar()
            }else {
                label.text = "El automovil tiene que estar ecnendido para acelerarlo"
            }
            
        case .electrico:
            if (estadoAutomovil){
                label.text = autoElectrico!.acelerar()
                autoElectrico!.porcentajeBatería = autoElectrico!.porcentajeBatería - 5
            }else {
                label.text = "El automovil elecricto tiene que estar ecnendido para acelerarlo"
            }
        }
    }
}

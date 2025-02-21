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
    
    var tipoAutomovil:Int?
    var automovilNormal:Automovil?
    var autoElectrico:AutomovilElectrico?
    var estadoAutomovil = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tipoAutomovil! {
        case 0:
            automovilNormal = Automovil()
            imagenView.image = UIImage(named: "automovil")
            label.text = "Se creo el automovil correctamente"
            
            
        case 1:
            autoElectrico = AutomovilElectrico()
            imagenView.image = UIImage(named: "autoelectrico")
            autoElectrico!.color = "Azul"
            autoElectrico!.precio = 10000
            label.text = "Se creo el atimovil eléctrico correctamente"
            
            
        default:
            print("Error")
            
        }
    }
    
    
    @IBAction func mostrarInformacion(_ sender: Any) {
        
        switch tipoAutomovil! {
        case 0:
            label.text = """
                        El automovil tiene 
                        \(automovilNormal!.numeroDeLlantas) llantas, es de color \(automovilNormal!.color), su precio es de \(automovilNormal!.precio) Euros 
                        """
            
        case 1:
            label.text = """
                        El automovil tinen
                        \(autoElectrico!.numeroDeLlantas) llantas, es de color \(autoElectrico!.color), su precio es de \(autoElectrico!.precio) Euros, \
                         su carga esta al \(autoElectrico!.porcentajeBatería) de bateria 
                       """
            
        default:
            print("Error")
        }
    }
    
    @IBAction func encender(_ sender: Any) {
        
        switch tipoAutomovil! {
        case 0:
            if (estadoAutomovil){
                estadoAutomovil = automovilNormal!.encender()
                label.text = "El automovil se encendio correctamente"
            }else {
                label.text = "El automovil ya esta encendido"
            }
            
        case 1:
            if (estadoAutomovil){
                estadoAutomovil = autoElectrico!.encender()
                label.text = "El automovil electrico se encendio correctamente"
                autoElectrico!.porcentajeBatería = 95
            }else {
                label.text = "El automovil electrico ya esta encendido"
            }
            
        default:
            print("Error")
        }
    }
    
    @IBAction func apagar(_ sender: Any) {
        switch tipoAutomovil! {
        case 0:
            if (estadoAutomovil){
                estadoAutomovil = automovilNormal!.apagar()
                label.text = "El automovil se apagó correctamente"
            }else {
                label.text = "El automovil ya esta apagado"
            }
            
        case 1:
            if (estadoAutomovil){
                estadoAutomovil = autoElectrico!.apagar()
                label.text = "El automovil electrico se apagó correctamente"
                
            }else {
                label.text = "El automovil electrico ya esta apagado"
            }
            
        default:
            print("Error")
        }
        
    }
    
    @IBAction func acelerar(_ sender: Any) {
        switch tipoAutomovil! {
            case 0:
            if (estadoAutomovil){
                label.text = automovilNormal!.acelerar()
            }else {
                label.text = "El automovil tiene que estar ecnendido para acelerarlo"
            }
            
        case 1:
            if (estadoAutomovil){
                label.text = autoElectrico!.acelerar()
                autoElectrico!.porcentajeBatería = autoElectrico!.porcentajeBatería - 5
            }else {
                label.text = "El automovil elecricto tiene que estar ecnendido para acelerarlo"
            }
                        
        default:
            print("Error")
        }
    }
}

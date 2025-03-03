//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Eduard Alexis Cardona Grajales on 27/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let KMyKey = "MyKey"
    
    // MARK: - life Cycle
    // 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = NSLocalizedString("Hello Hackermen", comment: "")
        welcomeLabel.text = NSLocalizedString("Welcome to EduardCG", comment: "")
            
    }

    // 2
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    // 3
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    // 4
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: - UserDefaults
    
    
    //  Recuperar la preferencias
    @IBAction func getButtonActiion(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: KMyKey){
            showAlert(message: value)
        }else{
            showAlert(message: "No hay valor para esta clave")
        }
        
    }
    // Guarda las preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("Suscribete", forKey: KMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado el valor")
    }
    
    
    // Borra las preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: KMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
        
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil )
        
    }
}


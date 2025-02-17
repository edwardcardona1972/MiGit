//
//  ViewControllerNegro.swift
//  Navegacion
//
//  Created by Eduard Alexis Cardona Grajales on 17/2/25.
//

import UIKit

class ViewControllerNegro: UIViewController {
    
    var titulo : String?
    var textoRecibir : String?
    var backgroundColor : UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titulo!
        self.backgroundColor = backgroundColor!
        self.view.backgroundColor = backgroundColor
       }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



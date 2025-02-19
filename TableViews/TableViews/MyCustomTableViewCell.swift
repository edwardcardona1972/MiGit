//
//  MyCustomTableViewCell.swift
//  TableViews
//
//  Created by Eduard Alexis Cardona Grajales on 18/2/25.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myFirstLabel: UILabel!  //componentes y asi creamos la //referencia en el controlador
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
   
    
    override func awakeFromNib() { // estas dos son operaciones por defecto
        super.awakeFromNib()
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20) //cambio de diferentes propiedades como la fuente
        myFirstLabel.textColor = .blue // color del texto
        
        backgroundColor = .gray // indicamos el color del fondo de la celda
        
        // aca podemos retocar cualquiera de los elementyos tanto como de la celda como c/u de los elementos custon que emos creado(Outlet)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)  // en la operacion (selected) podemos indicar que se pintara algo por pantalla que se desencadenara una acción concreta
        
        print(myFirstLabel.text ?? "")//aca imprimimos por defecto nuestra FirstLabel y como el valor puede ser nulo con los dos ?? un valor por defecto que puede ser el texto vacio
        
        // ahora tenemos que ir a nuestra tabla para poder utilizarla
    }
    
}

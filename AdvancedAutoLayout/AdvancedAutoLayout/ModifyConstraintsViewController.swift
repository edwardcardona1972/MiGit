//
//  ModifyConstraintsViewController.swift
//  AdvancedAutoLayout
//
//  Created by Eduard Alexis Cardona Grajales on 21/2/25.
//

import UIKit

class ModifyConstraintsViewController: UIViewController{
    
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        heightConstraints.constant = 300 // Modificar constraints
        topConstraints.constant = 64
    }
    
    
}

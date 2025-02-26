//
//  HomeViewController.swift
//  iOSCalculator
//
//  Created by Eduard Alexis Cardona Grajales on 26/2/25.
//

import UIKit

final class HomeViewController: UIViewController {
    
// MARK: - Outlets
    // Resurlt
    @IBOutlet weak var resultLabel: UILabel!
    
    //Number
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    
    //Operators
    @IBOutlet weak var operatorAc: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    
    
    // MARK: - Initialización
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfe Cycle
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

 // MARK: - Button Actions
    
    @IBAction func operatorACAction(_ sender: Any) {
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: Any) {
    }
    
    @IBAction func operatorPercentAction(_ sender: Any) {
    }
    
    @IBAction func operatorResultAction(_ sender: Any) {
    }
    
    @IBAction func operatorAdditionAction(_ sender: Any) {
    }
    
    @IBAction func operatorSubstractionAction(_ sender: Any) {
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: Any) {
    }
    
    @IBAction func operatorDivisionAction(_ sender: Any) {
    }
    
    @IBAction func numerDecimalAction(_ sender: Any) {
    }
    
    @IBAction func numerAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
}

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
    
    
    //MARK: - Variables
    
    private var total: Double = 0                   //Total
    private var temp: Double = 0                    //Valor por pantalla
    private var operating = false                   //Indicar si se ha selecionado un operador
    private var decimal = false                     //Indicar si el valor es decimal
    private var operation: OperationType = .none    //Operación actual
    
    
    // MARK: - Constantes
    
    private let KDecimalSepatator = Locale.current.decimalSeparator!
    private let KMaxLength = 9
    private let KTotal = "total"
        
    private enum OperationType   {
        case none, addition, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
        
    }()
    //Formateo de valores auxiliar
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
        
    }()
    
    //Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    // Formatear valores por pantalla en formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
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
              
        
        numberDecimal.setTitle(KDecimalSepatator, for: .normal)

        total = UserDefaults.standard.double(forKey: KTotal)
        result()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // UI
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        
        operatorAc.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
    }

 // MARK: - Button Actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        Clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) { // Buttos mas menos
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent { // distinto de
            result()
        }
        operating = true
        operation = .percent
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        
        operating = true
        operation = .addition
        sender.selectedOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .substraction
        sender.selectedOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .multiplication
        sender.selectedOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .division
        sender.selectedOperation(true)
        sender.shine()
    }
    
    @IBAction func numerDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating  && currentTemp.count >= KMaxLength {
            return
        }
        resultLabel.text = resultLabel.text! + KDecimalSepatator
        decimal = true
        
        selectVisualOperation()
        sender.shine()
         
    }
    
    @IBAction func numerAction(_ sender: UIButton) {
        
        operatorAc.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating  && currentTemp.count >= KMaxLength {
            
            return
        }
        currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        
        // Hemos seleccionado una operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        //Hemos seleccionado un decimal
        if decimal {
            currentTemp = "\(currentTemp)\(KDecimalSepatator)"
            decimal = false
        }
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))!
        
        selectVisualOperation()
        sender.shine()

    }
    
    // Limpia los valores
    private func Clear() {
        operation = .none
        operatorAc.setTitle("Ac", for: .normal)
        if temp != 0{
            temp = 0
            resultLabel.text = "0"
        }else {
            total = 0
            result()
        }
    }
    
    //Obtiene el resultado final
    private func result() {
        switch operation {
        case .none:
            // No hacemos nada
            break
        case .addition:
           total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total  = temp
            break
            
          
        }
        // Formateo por pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > KMaxLength{
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
            
        }else{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        operation = .none
        
        selectVisualOperation()
        UserDefaults.standard.set(total, forKey: KTotal)
        print("Total: \(total)")
    }
    // Muestra de forma visual la operacion seleccionada
    private func selectVisualOperation() {
        if !operating {
            //No estamos operando
            operatorAddition.selectedOperation(false)
            operatorSubstraction.selectedOperation(false)
            operatorMultiplication.selectedOperation(false)
            operatorDivision.selectedOperation(false)
        }else {
            switch operation {
                case .none, .percent:
                operatorAddition.selectedOperation(false)
                operatorSubstraction.selectedOperation(false)
                operatorMultiplication.selectedOperation(false)
                operatorDivision.selectedOperation(false)
                break
            case .addition:
                operatorAddition.selectedOperation(true)
                operatorSubstraction.selectedOperation(false)
                operatorMultiplication.selectedOperation(false)
                operatorDivision.selectedOperation(false)
                break
            case .substraction:
                operatorAddition.selectedOperation(false)
                operatorSubstraction.selectedOperation(true)
                operatorMultiplication.selectedOperation(false)
                operatorDivision.selectedOperation(false)
                break
            case .multiplication:
                operatorAddition.selectedOperation(false)
                operatorSubstraction.selectedOperation(false)
                operatorMultiplication.selectedOperation(true)
                operatorDivision.selectedOperation(false)
                break
            case .division:
                operatorAddition.selectedOperation(false)
                operatorSubstraction.selectedOperation(false)
                operatorMultiplication.selectedOperation(false)
                operatorDivision.selectedOperation(true)
                break
                
            }
    }
    }
}




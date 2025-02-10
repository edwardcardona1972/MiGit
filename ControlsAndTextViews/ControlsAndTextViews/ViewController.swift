//
//  ViewController.swift
//  ControlsAndTextViews
//
//  Created by Eduard Alexis Cardona Grajales on 2/2/25.
//

import UIKit

class ViewController: UIViewController {
    //outlts
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySliders: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicators: UIActivityIndicatorView!      
   
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myTextView: UITextView!
    
    
    //Variables
    private let myPickerViewValues = ["Uno", "Dos", "Tres","Cuatro","Cinco"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttons
        myButton.setTitle("Mi Boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //Pickersz
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //PageCOntrols
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //SemgmentedControls
        mySegmentedControl.removeAllSegments()
        for (index, valua) in
                myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: valua, at: index, animated: true)
        }
        
        //Sliders
        mySliders.maximumTrackTintColor = .red
        mySliders.minimumValue = 0
        mySliders.maximumValue = 4
        mySliders.value = 0
        
        //Stepper
        myStepper.minimumValue = 0
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //Switch
        mySwitch.onTintColor = .blue
        mySwitch.isOn = false
        
        //Progress View
               
        myProgressView.progressTintColor = .blue
        myProgressView.progress = 0
        myActivityIndicators.color = .orange
        myActivityIndicators.startAnimating()
        myActivityIndicators.hidesWhenStopped = true
        
        //Label
       // myStepperLabel.textColor = .darkGray
        //myStepperLabel.font = UIFont.boldSystemFont(ofSize: 17)
        //myStepperLabel.text = "1"
        
        //TextFiels
        
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe Algo"
        myTextField.delegate = self
        
        //TextViews
        
        myTextView.textColor = .brown
        myTextView.delegate = self
                                                     
    }
    //Actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
            
        }else {
            myButton.backgroundColor = .blue
        }
        myTextView.resignFirstResponder()
        
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        mySliders.value = Float(myPageControl.currentPage)
        myProgressView.progress = Float(myPageControl.currentPage)/Float(myPickerViewValues.count)
        
    }
       
    
    @IBAction func mySegmentedControlAtions(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        mySliders.value = Float(mySegmentedControl.selectedSegmentIndex)
        myProgressView.progress = Float(mySegmentedControl.selectedSegmentIndex)/Float(myPickerViewValues.count)
        
    }
    
        
    @IBAction func mySliderAction(_ sender: Any) {
       
        mySegmentedControl.selectedSegmentIndex = Int(mySliders.value)
        myPickerView.selectRow(Int(mySliders.value), inComponent: 0, animated: true)
        myPageControl.currentPage = Int(mySliders.value)
        myProgressView.progress = Float(mySliders.value)/Float(myPickerViewValues.count)
        
        let myString = myPickerViewValues[Int(mySliders.value)]
        myButton.setTitle(myString, for: .normal)
        
        
        
        
    }
        
    @IBAction func myStepperAcction(_ sender: Any) {
        
        let value = Int (myStepper.value)
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        myPageControl.currentPage = value
        mySegmentedControl.selectedSegmentIndex = value
        mySliders.value = Float(value)
        myProgressView.progress = Float(value)/Float(myPickerViewValues.count)
        
        let myString = myPickerViewValues[Int(mySliders.value)]
        myButton.setTitle(myString, for: .normal)
        
        
    }
    @IBAction func mySwitchAction(_ sender: Any) {
        
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityIndicators.stopAnimating()
            
            
            
        }else{
            myPickerView.isHidden = true
            myActivityIndicators.startAnimating()
            
        }
    }
}

//UIPickerViewController, UIPickerViewDelegate


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
      
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
       myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
        myProgressView.setProgress(Float(row)/Float(myPickerViewValues.count), animated: true)
        
    }
    
    
}
//UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(textField.text, for: .normal)
    }
}
//UUIWebViewDelegate
extension ViewController: UITextViewDelegate {
    
     func textViewDidBeginEditing(_ textView: UITextView) {
         myTextField.isHidden = false
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = true

}
}

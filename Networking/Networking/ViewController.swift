//
//  ViewController.swift
//  Networking
//
//  Created by Eduard Alexis Cardona Grajales on 2/3/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = ""
        nameLabel.numberOfLines = 0
        emailLabel.text = ""
        nameLabel.numberOfLines = 0
        idLabel.text = ""
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    @IBAction func getUserAction(_ sender: Any) {
        
        NetworkingProvider.shared.getUser(id: 123){(user) in
            
            self.activityIndicator.stopAnimating()
            
           
        }failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.localizedDescription
            
        }
        
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "EduardCG", email: "eduardcg@gmail.com", gender: "Male", status: "Active")
        activityIndicator.startAnimating()
        NetworkingProvider.shared.addUser(user: newUser) { (user) in
            
            
            self.activityIndicator.stopAnimating()
            
            
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            
        }
        
    }
    
    @IBAction func updateUserAction(_ sender: Any) {
        
        let newUser = NewUser(name: "EduardCG 2", email: nil, gender: nil, status: nil)
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.updateUser(id:123, user: newUser) { (user) in
            
            
            self.activityIndicator.stopAnimating()
            
            
            
            
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
            
        }
    }
    private func setup(user: User) {
        
        self.nameLabel.text = user.name
        self.emailLabel.text = user.email
        self.idLabel.text = user.id?.description
    }
}

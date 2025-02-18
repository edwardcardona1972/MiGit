//
//  ViewController.swift
//  CollectionViews
//
//  Created by Eduard Alexis Cardona Grajales on 18/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colletionView: UICollectionView!
    
    private  lef myCountries = ["España", "Mexico", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.dataSource = self
        
        colletionView.register(UINib(nibName: "MyCustomColectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "mycell")
    }

}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCountries.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as?
        MyCustomColectionViewCell
      
        cell?.myFirstLabel.text = myCountries[indexPath.item]
        return cell!
    }
}

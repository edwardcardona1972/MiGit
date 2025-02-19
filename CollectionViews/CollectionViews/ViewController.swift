//
//  ViewController.swift
//  CollectionViews
//
//  Created by Eduard Alexis Cardona Grajales on 18/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colletionView: UICollectionView!
    
    private  let myCountries: [String] = ["España", "Mexico", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]
    
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colletionView.dataSource = self
        colletionView.delegate = self
        
        colletionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "mycell")
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
            MyCustomCollectionViewCell
      
        cell!.myFirstLabel.text = myCountries[indexPath.row]
        return cell!
    }
}
//MARK - UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.section) ->\(indexPath.row) \(myCountries[indexPath.row])")
    }
}

//MARK - UICollectonViewDelegateFlowLayout

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth, height: myCellWidth)
    }
}

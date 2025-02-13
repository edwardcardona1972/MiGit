//
//  PageViewController.swift
//  ViewAndNavigationControls
//
//  Created by Eduard Alexis Cardona Grajales on 12/2/25.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var myControllers: [UIViewController] = []
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vcGreen")
        let myGrayVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vcGray")
        
        myControllers.append(myGreenVC)
        myControllers.append(myGrayVC)
        
        setViewControllers([myGreenVC],direction: .forward,animated: true,completion: nil  )
        
        dataSource = self
    }
    

    
    }
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)!
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)!
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
}
    


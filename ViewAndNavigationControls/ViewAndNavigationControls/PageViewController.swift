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
        
        let listaContenedores = ["vcGreen", "vcGray"]
        
        listaContenedores.forEach { (contenedorName) in
            let contenedor = instantiateViewController(withIdentifier: contenedorName)
            
            myControllers.append(contenedor)
            
            setViewControllers(contenedorName == "vcGreen" ? [contenedor] : [contenedor], direction: .forward,animated: true,completion: nil  )
        }
        
        dataSource = self
    }
    
    func instantiateViewController(withIdentifier identifier: String, fromStoryboard storyboardName: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
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
    


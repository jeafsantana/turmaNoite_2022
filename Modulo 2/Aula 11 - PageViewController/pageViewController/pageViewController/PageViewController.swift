//
//  PageViewController.swift
//  pageViewController
//
//  Created by Jessica Santana on 13/05/22.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var listaDeViewControllersQueVaoSerExibidas: [UIViewController?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let vcVermelha = storyboard?.instantiateViewController(withIdentifier: "viewVermelha")
        let vcVerde = storyboard?.instantiateViewController(withIdentifier: "viewVerde")
        
        listaDeViewControllersQueVaoSerExibidas.append(vcVermelha)
        listaDeViewControllersQueVaoSerExibidas.append(vcVerde)
        
        dataSource = self
        
        setViewControllers([listaDeViewControllersQueVaoSerExibidas[0]!], direction: .forward, animated: true)
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return listaDeViewControllersQueVaoSerExibidas.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexDaViewControllerReferencia = listaDeViewControllersQueVaoSerExibidas.firstIndex(of: viewController) else { return nil }
        
        if indexDaViewControllerReferencia <= 0 { return nil }
        
        return listaDeViewControllersQueVaoSerExibidas[indexDaViewControllerReferencia - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexDaViewControllerReferencia = listaDeViewControllersQueVaoSerExibidas.firstIndex(of: viewController) else { return nil }
        
        if indexDaViewControllerReferencia >= listaDeViewControllersQueVaoSerExibidas.count - 1 { return nil }
        
        return listaDeViewControllersQueVaoSerExibidas[indexDaViewControllerReferencia + 1]
    }
    
}

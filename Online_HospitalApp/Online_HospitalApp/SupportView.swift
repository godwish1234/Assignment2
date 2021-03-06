//
//  SupportView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 18/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class SupportView: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //declare a variable to alter between page view controller
    lazy var VCArr: [UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC")]
    }()
    
    //set as main views
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        
        if let firstVC = VCArr.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        }
        
        
    }
    
    //function of to scroll between page view
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCArr.last
        }
        
        guard VCArr.count > previousIndex else {
            return nil
        }
        
        return VCArr[previousIndex]
        
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArr.count else {
            return VCArr.first
        }
        
        guard VCArr.count > nextIndex else {
            return nil
        }
        
        return VCArr[nextIndex]
        
    }
    
    //create an identifier
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}

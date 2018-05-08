//
//  PageViewController.swift
//  KellyBennett_MultiplePages
//
//  Created by student on 3/20/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    
    lazy var orderedViewControllers: [UIViewController] = { return [self.newVc(viewController: "sbViewA"), self.newVc(viewController: "sbViewB"),self.newVc(viewController: "sbViewC")]
    }()
    
    var pageControl = UIPageControl()
    let user = User.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        // Do any additional setup after loading the view.
        
        self.dataSource = self
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
        setViewControllers([firstViewController], direction: .forward,
                           animated: true,
                           completion: nil)
        
    }
        self.delegate = self
        configurePageControl()
     
    for index in 0...orderedViewControllers.count-1
    {
        user.viewControllers.append(orderedViewControllers[index])
    }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) }
    
    
    
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else { return nil
        }
        let previousIndex = viewControllerIndex - 1
        // User is on the first view controller and swiped left to loop to // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop. // return nil
        }
        guard orderedViewControllers.count > previousIndex else { return nil
        }
        return orderedViewControllers[previousIndex] }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? { guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
        return nil }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        // User is on the last view controller and swiped right to loop to // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop. // return nil
        }
        guard orderedViewControllersCount > nextIndex else { return nil
        }
        return orderedViewControllers[nextIndex] }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width:
            UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        
        self.pageControl.tintColor = UIColor.yellow
        self.pageControl.pageIndicatorTintColor = UIColor.green
        self.pageControl.currentPageIndicatorTintColor = UIColor.purple
        self.view.addSubview(pageControl)
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)! }

    
    
}

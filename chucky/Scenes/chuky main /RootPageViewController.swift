//
//  RootPageViewController.swift
//  chucky
//
//  Created by Lasha Tavberidze on 15.01.25.
//
import UIKit

typealias PageView = UIPageViewControllerDataSource & UIPageViewControllerDelegate

class RootPageViewController: UIPageViewController {
    
    private lazy var orderedViewControllers: [UIViewController] = {
        let sb = UIStoryboard(name: "Chucky", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "CelebrityID")
        let vc2 = sb.instantiateViewController(withIdentifier: "DevID")
        let vc3 = sb.instantiateViewController(withIdentifier: "MusicID")
        return [vc1, vc2, vc3]
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView{
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = .clear
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - Extensions for DataSource
extension RootPageViewController: PageView {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        return orderedViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController), index < orderedViewControllers.count - 1 else {
            return nil
        }
        return orderedViewControllers[index + 1]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        orderedViewControllers.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentViewController = viewControllers?.first else {
            return 0
        }
        return orderedViewControllers.firstIndex(of: currentViewController) ?? 0
    }
}


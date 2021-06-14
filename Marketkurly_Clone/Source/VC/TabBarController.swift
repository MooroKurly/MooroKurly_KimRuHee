//
//  UITabBarController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/30.
//

import UIKit

//class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.viewControllers = [homeTabBar, recomTabBar, cateTabBar, searchTabBar, myTabBar]
//
//        tabBar.tintColor = .kurlyPurple
//        tabBar.backgroundColor = .white
//    }
//
//    lazy public var homeTabBar : ViewController = {
//        let homeTab = ViewController()
//        let title = "홈"
//        let defaultImage = UIImage(named: "ic_home_unactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage = UIImage(named: "ic_home")
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
//
//        homeTab.tabBarItem = tabBarItem
//
//        return homeTab
//    }()
//
//    lazy public var recomTabBar : RecommandViewController = {
//        let recomTabBar = RecommandViewController()
//        let title = "추천"
//        let defaultImage = UIImage(named: "ic_recom_unactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage = UIImage(named: "ic_recom")
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
//
//        recomTabBar.tabBarItem = tabBarItem
//
//        return recomTabBar
//    }()
//
//    lazy public var cateTabBar : CategoryViewController = {
//        let cateTabBar = CategoryViewController()
//        let title = "카테고리"
//        let defaultImage = UIImage(named: "ic_category_unactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage = UIImage(named: "ic_category")
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
//
//        cateTabBar.tabBarItem = tabBarItem
//
//        return cateTabBar
//    }()
//
//    lazy public var searchTabBar : SearchViewController = {
//        let searchTabBar = SearchViewController()
//        let title = "검색"
//        let defaultImage = UIImage(named: "ic_search_unactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage = UIImage(named: "ic_search")
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
//
//        searchTabBar.tabBarItem = tabBarItem
//
//        return searchTabBar
//    }()
//
//    lazy public var myTabBar : MykurlyViewController = {
//        let myTabBar = MykurlyViewController()
//        let title = "마이컬리"
//        let defaultImage = UIImage(named: "ic_my_unactive")?.withRenderingMode(.alwaysOriginal)
//        let selectedImage = UIImage(named: "ic_my")
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
//
//        myTabBar.tabBarItem = tabBarItem
//
//        return myTabBar
//    }()
//
//
//
//}
//
//extension TabBarController: UITabBarControllerDelegate {
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
//    }
//
//}


class TabBarController : UITabBarController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
        
    //MARK: - Helpers
    
    func configureViewControllers() {
        
        view.backgroundColor = .white
        
        let home = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_home_unactive"), selectedImage: #imageLiteral(resourceName: "ic_home"), title: "홈", rootViewController: ViewController())
        
        let recommend = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_recom_unactive"), selectedImage: #imageLiteral(resourceName: "ic_recom"), title: "추천", rootViewController: SearchViewController())
        
        let category = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_category_unactive"), selectedImage: #imageLiteral(resourceName: "ic_category"), title: "카테고리", rootViewController: CategoryViewController())
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_search_unactive"), selectedImage: #imageLiteral(resourceName: "ic_search"), title: "검색",rootViewController: SearchViewController())
        
        let myKurly = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_my_unactive"), selectedImage: #imageLiteral(resourceName: "ic_my"), title: "마이컬리",rootViewController: MykurlyViewController())
        
        viewControllers = [home, recommend, category, search, myKurly]
        
        tabBar.tintColor = .kurlyPurple
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, title: String,
                                      rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isHidden = true
        nav.title = title
        return nav
    }
}

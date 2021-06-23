//
//  UITabBarController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/30.
//

import UIKit

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
        
        let recommend = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "ic_recom_unactive"), selectedImage: #imageLiteral(resourceName: "ic_recom"), title: "추천", rootViewController: RecommandViewController())
        
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

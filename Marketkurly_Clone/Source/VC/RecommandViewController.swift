//
//  RecommandViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

class RecommandViewController: UIViewController {

    //MARK: - Property
    
    var headerView : TopHeaderView = TopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "추천"
        }
    
    

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    //MARK: - configureUI
    
    func configureUI() {
        
        view.addSubview(headerView)

        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
     
    }

}

//
//  JoinViewController.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

class JoinViewController: UIViewController {

    // MARK: - Property
    
    var headerView : SettingTopHeaderView = SettingTopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "회원가입"
        }

    var closeButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnClose"), for: .normal)
            btn.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureUI()

    }
    
    // MARK: - UI
    
    func configureUI() {
        
        view.addSubview(headerView)
        headerView.addSubview(closeButton)
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.leading.bottom.equalToSuperview()
        }
    }
    
    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

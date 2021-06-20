//
//  MykurlyViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

class MykurlyViewController: UIViewController {
    
    var firstArray = ["비회원 주문 조회", "알림 설정"]
    var secondArray = ["컬리소개", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]

    //MARK: - Property
    
    var headerView : TopHeaderView = TopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "마이컬리"
        }
    
    let mypageTV = UITableView()
    

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mypageTV.delegate = self
        mypageTV.dataSource = self
        
        mypageTV.register(MykurlyUpperTableCell.self, forCellReuseIdentifier: "MykurlyUpperTableCell")
        mypageTV.register(MykurlyTableCell.self, forCellReuseIdentifier: "MykurlyTableCell")
        
        configureUI()
    }
    

    //MARK: - configureUI
    
    func configureUI() {
        
        mypageTV.backgroundColor = .kurlyBackgroundGray
        view.addSubview(headerView)
        view.addSubview(mypageTV)
        
        mypageTV.separatorStyle = .none

        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
     
        mypageTV.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc func gotoEnter(_ sender: UIButton) {
        
        let rootVC = LoginViewController()
        let nextVC = UINavigationController(rootViewController: rootVC)
    
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
        
    }
}

extension MykurlyViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .kurlyBackgroundGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 217
    
        default:
            return 50
        }
    }
    
}

extension MykurlyViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        case 1:
            return firstArray.count
            
        default:
            return secondArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let upperCell = tableView.dequeueReusableCell(withIdentifier: "MykurlyUpperTableCell", for: indexPath) as? MykurlyUpperTableCell else { return UITableViewCell() }
            upperCell.configureUI()
            upperCell.selectionStyle = .none
            upperCell.joinButton.addTarget(self, action: #selector(gotoEnter(_:)), for: .touchUpInside)
            return upperCell
            
        case 1:
            guard let menuCell = tableView.dequeueReusableCell(withIdentifier: "MykurlyTableCell", for: indexPath) as? MykurlyTableCell else { return UITableViewCell() }
            menuCell.configureUI()
            menuCell.menuLabel.text = firstArray[indexPath.row]
            
            return menuCell
            
        default:
            guard let menuCell = tableView.dequeueReusableCell(withIdentifier: "MykurlyTableCell", for: indexPath) as? MykurlyTableCell else { return UITableViewCell() }
            menuCell.configureUI()
            menuCell.menuLabel.text = secondArray[indexPath.row]
            
            return menuCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

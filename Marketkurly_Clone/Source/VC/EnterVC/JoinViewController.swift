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
            btn.setImage(UIImage(named: "btnGoback"), for: .normal)
            btn.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        }
    
    var mainTV = UITableView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTV.separatorStyle = .none
        
        mainTV.delegate = self
        mainTV.dataSource = self
        mainTV.register(JoinTableCell.self, forCellReuseIdentifier: "JoinTableCell")
        
        configureUI()

    }
    
    // MARK: - UI
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        view.addSubviews(headerView, mainTV)
        headerView.addSubview(closeButton)
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.bottom.equalTo(-0.5)
        }
        
        mainTV.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Function
    
    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - UITableViewDelegate

extension JoinViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .kurlyBackgroundGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 1180
        default:
            return 566
        }
    }
}

// MARK: - UITableViewDataSource

extension JoinViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 1
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JoinTableCell", for: indexPath) as? JoinTableCell else { return UITableViewCell() }
            cell.configureFirstCellUI()
            cell.selectionStyle = .none
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JoinTableCell", for: indexPath) as? JoinTableCell else { return UITableViewCell() }
            cell.configureSecondCellUI()
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    
}

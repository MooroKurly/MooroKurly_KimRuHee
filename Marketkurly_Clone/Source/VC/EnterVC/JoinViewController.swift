//
//  JoinViewController.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

class JoinViewController: UIViewController {
    
    let joinFirstView = JoinFirstTableView()
    
    var gender : String = ""

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
    
    @objc func pressJoinButton(_ sender: UIButton) {
        
        if joinFirstView.boyToggleButton.isSelected == true && joinFirstView.girlToggleButton.isSelected == false {
            gender = "남"
        } else if joinFirstView.girlToggleButton.isSelected == true && joinFirstView.boyToggleButton.isSelected == false {
            gender = "여"
        }

        JoinService.shared.join(id: joinFirstView.idTextField.text!,
                                password: joinFirstView.pwTextField.text!,
                                name: joinFirstView.nameTextField.text!,
                                email: joinFirstView.emailTextField.text!,
                                phone: joinFirstView.phoneTextField.text!,
                                address: joinFirstView.addressTextField.text!,
                                birth: joinFirstView.birthTextField.text!,
                                gender: gender) { result in

            switch result {
            case .success(let msg):
                if let msg = msg as? String {
                    print("success", msg)

                }
                
                self.navigationController?.popViewController(animated: true)
            
                
            case .requestErr(let msg):
                if let msg = msg as? String {
                    print("requestErr",msg)
                }
                
                self.navigationController?.popViewController(animated: true)

            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }

        }
        
        
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
            cell.secondView.joinButton.addTarget(self, action: #selector(pressJoinButton(_:)), for: .touchUpInside)
            return cell
        }
        
    }
    
    
}

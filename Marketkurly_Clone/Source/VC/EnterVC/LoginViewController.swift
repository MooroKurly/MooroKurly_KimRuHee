//
//  LoginViewController.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    var headerView : SettingTopHeaderView = SettingTopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "로그인"
        }

    var closeButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnClose"), for: .normal)
            btn.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        }
    
    let idTextField : UITextField = UITextField().ductTape
        .placeholder("아이디를 입력해주세요")
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .borderStyle(.roundedRect)
    
    let pwTextField : UITextField = UITextField().ductTape
        .placeholder("비밀번호를 입력해주세요")
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .borderStyle(.roundedRect)
    
    let loginButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnLogin"), for: .normal)
            btn.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        }
    
    let findButton : UILabel = UILabel().ductTape
        .text("아이디 찾기 | 비밀번호 찾기")
        .textColor(.kurlyTextGray)
        .font(.systemFont(ofSize: 13, weight: .semibold))
    
    let joinButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnSignup"), for: .normal)
            btn.addTarget(self, action: #selector(goToJoin(_:)), for: .touchUpInside)
        }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }
    
    // MARK: - UI
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        headerView.addSubview(closeButton)
        view.addSubviews(headerView, idTextField, pwTextField, loginButton, findButton, joinButton)
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.leading.bottom.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(24)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        findButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        joinButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(64)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    
    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @objc func goToJoin(_ sender: UIButton) {
        let nextVC = JoinViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
        navigationController?.pushViewController(nextVC, animated: true)
        print("ㅇ")
    }
    
    @objc func login(_ sender: UIButton) {
        
        AuthService.shared.login(id: self.idTextField.text!, password: self.pwTextField.text!) { result in
            switch result {
            case .success(let msg):

                if let msg = msg as? String {
                    print("success", msg)
                }
            
            case .requestErr(let msg):
                print("requestERR", msg)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
}

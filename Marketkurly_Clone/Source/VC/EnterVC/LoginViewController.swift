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
            btn.addTarget(self, action: #selector(pressCloseButton(_:)), for: .touchUpInside)
        }
    
    let idTextField : UITextField = UITextField().ductTape
        .placeholder("아이디를 입력해주세요")
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .reinforce { (tf) in
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholderPadding()
        }
    
    let pwTextField : UITextField = UITextField().ductTape
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .reinforce { (tf) in
            tf.placeholder = "비밀번호를 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholderPadding()
            tf.isSecureTextEntry = true
        }
    
    var loginButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.layer.cornerRadius = 5.0
            btn.backgroundColor = .kurlyPurple
            btn.setTitle("로그인", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            btn.addTarget(self, action: #selector(pressLoginButton(_:)), for: .touchUpInside)
        }
    
    let findButton : UILabel = UILabel().ductTape
        .text("아이디 찾기 | 비밀번호 찾기")
        .textColor(.kurlyTextGray)
        .font(.systemFont(ofSize: 13, weight: .semibold))
    
    var joinButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.layer.cornerRadius = 5.0
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.kurlyPurple.cgColor
            btn.layer.cornerRadius = 5.0
            btn.backgroundColor = .white
            btn.setTitle("회원가입", for: .normal)
            btn.setTitleColor(.kurlyPurple, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            btn.addTarget(self, action: #selector(pressJoinButton(_:)), for: .touchUpInside)
            
        }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        pwTextField.delegate = self
        
        configureUI()
        
        navigationController?.navigationBar.isHidden = true

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
            make.leading.equalToSuperview()
            make.bottom.equalTo(-0.5)
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
            make.height.equalTo(48)
        }
        
        findButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        joinButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(64)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - Function
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func pressCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @objc func pressJoinButton(_ sender: UIButton) {
///       여기 push로 열려야 하는데 그건 안됨.. 아직
        let nextVC = JoinViewController()
        nextVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(nextVC, animated: true)
//        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func pressLoginButton(_ sender: UIButton) {
        
        LoginService.shared.login(id: self.idTextField.text!, password: self.pwTextField.text!) { result in
            switch result {
            case .success(let msg):

                if let msg = msg as? String {
                    print("success", msg)
                }
                
                self.dismiss(animated: true, completion: nil)
            
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

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            idTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
        default:
            pwTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            idTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
        default:
            pwTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case idTextField:
            pwTextField.becomeFirstResponder()
        default:
            pwTextField.resignFirstResponder()
        }
        
        return true
    }
}

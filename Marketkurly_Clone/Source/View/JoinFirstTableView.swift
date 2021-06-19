//
//  JoinFirstTableView.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import UIKit

class JoinFirstTableView: UIView {
    
    // MARK: - Property

    var idLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "아이디*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var idTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "아이디를 입력해주세요"
        }
    
    var checkButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnDoublecheck"), for: .normal)
        }
    
    var pwLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "비밀번호*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var pwTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "비밀번호를 입력해주세요"
        }
    
    var pwCheckLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "비밀번호 확인*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var pwCheckTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "비밀번호를 한번 더 입력해주세요"
        }
    
    var nameLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "이름*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var nameTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "이름을 입력해주세요"
        }
    
    var emailLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "이메일*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var emailTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "예: marketkurly@kurly.com"
        }
    
    var phoneLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "휴대폰*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var phoneTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "숫자만 입력해주세요"
        }
    
    var getNumberButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnGetnumber"), for: .normal)
        }
    
    var addressLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "주소*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributtedString = NSMutableAttributedString(string: label.text!)
            attributtedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributtedString
        }
    
    var addressButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor(red: 220.0 / 255.0, green: 221.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0).cgColor
            btn.layer.cornerRadius = 5.0
            btn.backgroundColor = .white
            btn.tintColor = .white
        }
    
    var addressPlaceholderLabel : UILabel = UILabel().ductTape
        .text("도로명, 지번, 건물명 검색")
        .font(.systemFont(ofSize: 16, weight: .semibold))
        .textColor(UIColor(red: 220.0 / 255.0, green: 221.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0))
    
    var addressInfoLabel : UILabel = UILabel().ductTape
        .text("배송지에 따라 상품 정보가 달라질 수 있습니다.")
        .font(.systemFont(ofSize: 12, weight: .semibold))
        .textColor(UIColor(white: 153.0 / 255.0, alpha: 1.0))
    
    var birthdayLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "생년월일"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
        }
    
    var birthdayTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .roundedRect
            tf.placeholder = "YYYY / MM / DD"
        }
    
    var sexLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "성별"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
        }
    
    var boyToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
    
    var boyLabel : UILabel = UILabel().ductTape
        .text("남자")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var girlToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
    
    var girlLabel : UILabel = UILabel().ductTape
        .text("여자")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var noToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
    
    var noLabel : UILabel = UILabel().ductTape
        .text("선택안함")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var alphaLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "추가입력 사항\n추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다."
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.numberOfLines = 0
            
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyDarkGray,
                                          range: (label.text! as NSString).range(of:"추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다."))
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12),
                                          range: (label.text! as NSString).range(of:"추천인 아이디와 참여 이벤트명 중 하나만 선택 가능합니다."))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            
            label.attributedText = attributedString
        }
    
    
    var recommToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
    
    var recommIDLabel : UILabel = UILabel().ductTape
        .text("추천인 아이디")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var eventToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
    
    var eventLabel : UILabel = UILabel().ductTape
        .text("참여 이벤트명")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    
    // MARK: - UI
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(idLabel, idTextField, checkButton,
                    pwLabel, pwTextField, pwCheckLabel, pwCheckTextField,
                    nameLabel, nameTextField, emailLabel, emailTextField,
                    phoneLabel, phoneTextField, getNumberButton,
                    addressLabel, addressButton, addressInfoLabel,
                    birthdayLabel, birthdayTextField, sexLabel,
                    boyToggleButton, boyLabel, girlToggleButton, girlLabel,
                    noToggleButton, noLabel, alphaLabel,
                    recommToggleButton, recommIDLabel, eventToggleButton, eventLabel)
        
        addressButton.addSubview(addressPlaceholderLabel)
        
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.leading.equalTo(20)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.height.equalTo(48)
        }
        
        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.leading.equalTo(idTextField.snp.trailing).offset(8)
            make.trailing.equalTo(-20)
        }
        
        pwLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        pwCheckLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pwTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        pwCheckTextField.snp.makeConstraints { (make) in
            make.top.equalTo(pwCheckLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pwCheckTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            //            make.trailing.equalTo(getNumberButton.snp.leading)
            make.height.equalTo(48)
            
        }
        
        getNumberButton.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            //            make.leading.equalTo(phoneTextField.snp.trailing).offset(8)
            make.trailing.equalTo(-20)
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        addressButton.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        addressPlaceholderLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
        }
        
        addressInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressButton.snp.bottom).offset(9)
            make.leading.equalTo(20)
        }
        
        birthdayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressInfoLabel.snp.bottom).offset(25)
            make.leading.equalTo(20)
        }
        
        birthdayTextField.snp.makeConstraints { (make) in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        sexLabel.snp.makeConstraints { (make) in
            make.top.equalTo(birthdayTextField.snp.bottom).offset(24)
            make.leading.equalTo(20)
        }
        
        boyToggleButton.snp.makeConstraints { (make) in
            make.top.equalTo(sexLabel.snp.bottom).offset(13)
            make.leading.equalTo(14)
        }
        
        boyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sexLabel.snp.bottom).offset(22)
            make.leading.equalTo(boyToggleButton.snp.trailing).offset(6)
        }
        
        girlToggleButton.snp.makeConstraints { (make) in
            make.top.equalTo(boyToggleButton.snp.bottom).offset(12)
            make.leading.equalTo(14)
        }
        
        girlLabel.snp.makeConstraints { (make) in
            make.top.equalTo(boyLabel.snp.bottom).offset(28)
            make.leading.equalTo(girlToggleButton.snp.trailing).offset(6)
        }
        
        noToggleButton.snp.makeConstraints { (make) in
            make.top.equalTo(girlToggleButton.snp.bottom).offset(12)
            make.leading.equalTo(14)
        }
        
        noLabel.snp.makeConstraints { (make) in
            make.top.equalTo(girlLabel.snp.bottom).offset(28)
            make.leading.equalTo(noToggleButton.snp.trailing).offset(6)
        }
        
        alphaLabel.snp.makeConstraints { (make) in
            make.top.equalTo(noToggleButton.snp.bottom).offset(38)
            make.leading.equalTo(20)
        }
        
        recommToggleButton.snp.makeConstraints { (make) in
            make.top.equalTo(alphaLabel.snp.bottom).offset(12)
            make.leading.equalTo(14)
        }
        
        recommIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(alphaLabel.snp.bottom).offset(20)
            make.leading.equalTo(recommToggleButton.snp.trailing).offset(6)
        }
        
        eventToggleButton.snp.makeConstraints { (make) in
            make.top.equalTo(recommToggleButton.snp.bottom).offset(12)
            make.leading.equalTo(14)
        }
        
        eventLabel.snp.makeConstraints { (make) in
            make.top.equalTo(recommIDLabel.snp.bottom).offset(28)
            make.leading.equalTo(recommToggleButton.snp.trailing).offset(6)
        }
        
    }
    
    // MARK: - Function
    
    @objc func selectOption(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
        print("d")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

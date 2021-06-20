//
//  JoinSecondTableView.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import UIKit

class JoinSecondTableView: UIView {
    
    let joinFirstView = JoinFirstTableView()
    
    var gender : String = ""

    // MARK: - Property
    
    var termLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "이용약관동의*"
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (label.text! as NSString).range(of:"*"))
            
            label.attributedText = attributedString
        }
    
    var termCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(pressTermCheckButton(_:)), for: .touchUpInside)
//            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
        }
  
    
    var agreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "전체 동의합니다.\n선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다."
            label.numberOfLines = 0
            label.textColor = .kurlyBlack
            label.font = .systemFont(ofSize: 16, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyDarkGray, range: (label.text! as NSString).range(of:"선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다."))
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .semibold), range: (label.text! as NSString).range(of:"선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다."))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
                        
            label.attributedText = attributedString
        }
    
    var lineView : UIView = UIView().ductTape
        .backgroundColor(.kurlyLightGray)
    
    var firstCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var firstAgreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "이용약관동의 (필수)"
            label.textColor = .kurlyDarkGray
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyTextGray, range: (label.text! as NSString).range(of:"(필수)"))
            
            label.attributedText = attributedString
        }
    
    var firstMoreButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnSeeTerm"), for: .normal)
        }
    
    var secondCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var secondAgreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "개인정보 수집/이용 동의 (필수)"
            label.textColor = .kurlyDarkGray
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyTextGray, range: (label.text! as NSString).range(of:"(필수)"))
            
            label.attributedText = attributedString
        }
    
    var secondMoreButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnSeeTerm"), for: .normal)
        }
        
    var thirdCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var thirdAgreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "개인정보 수집/이용 동의 (선택)"
            label.textColor = .kurlyDarkGray
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyTextGray, range: (label.text! as NSString).range(of:"(선택)"))
            
            label.attributedText = attributedString
        }
    
    var thirdMoreButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnSeeTerm"), for: .normal)
        }
    
    var fourthCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var fourthAgreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "무료배송, 할인쿠폰 등 혜택/정보 수신 동의 (선택)"
            label.textColor = .kurlyDarkGray
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyTextGray, range: (label.text! as NSString).range(of:"(선택)"))
            
            label.attributedText = attributedString
        }
    
    var smsCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var smsLabel : UILabel = UILabel().ductTape
        .text("SMS")
        .font(.systemFont(ofSize: 14, weight: .semibold))
        .textColor(.kurlyDarkGray)
    
    var emailCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var emailLabel : UILabel = UILabel().ductTape
        .text("이메일")
        .font(.systemFont(ofSize: 14, weight: .semibold))
        .textColor(.kurlyDarkGray)
    
    var eventImageView : UIImageView = UIImageView().ductTape
        .image(UIImage(named: "imgPopup"))
        
    var ageCheckButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnUncheck"), for: .normal)
            btn.setImage(UIImage(named: "btnCheck"), for: .selected)
            btn.addTarget(self, action: #selector(selectOption(_:)), for: .touchUpInside)
            
        }
    
    var ageAgreeLabel : UILabel = UILabel().ductTape
        .reinforce { (label) in
            label.text = "본인은 만 14세 이상입니다. (필수)"
            label.textColor = .kurlyDarkGray
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            let attributedString = NSMutableAttributedString(string: label.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.kurlyTextGray, range: (label.text! as NSString).range(of:"(필수)"))
            
            label.attributedText = attributedString
        }
    
    var joinButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.addTarget(self, action: #selector(joinAction(_:)), for: .touchUpInside)
            btn.layer.cornerRadius = 5.0
            btn.backgroundColor = .kurlyPurple
            btn.setTitle("가입하기", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        }
    
    
    // MARK: - UI
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(termLabel, termCheckButton, agreeLabel, lineView,
                    firstCheckButton, firstAgreeLabel, firstMoreButton,
                    secondCheckButton, secondAgreeLabel, secondMoreButton,
                    thirdCheckButton, thirdAgreeLabel, thirdMoreButton,
                    fourthCheckButton, fourthAgreeLabel,
                    smsCheckButton, smsLabel, emailCheckButton, emailLabel,
                    eventImageView, ageCheckButton, ageAgreeLabel, joinButton)
        
        
        termLabel.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.leading.equalTo(20)
        }
        
        termCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(termLabel.snp.bottom).offset(16)
            make.leading.equalTo(14)
        }
        
        agreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(termLabel.snp.bottom).offset(24)
            make.leading.equalTo(termCheckButton.snp.trailing).offset(6)
            make.trailing.equalTo(-20)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(agreeLabel.snp.bottom).offset(14)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(1)
        }
        
        firstCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(14)
            make.leading.equalTo(14)
        }
        
        firstAgreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(25)
            make.leading.equalTo(firstCheckButton.snp.trailing).offset(6)
        }
        
        firstMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(16)
            make.trailing.equalTo(-4)
        }
        
        secondCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(firstCheckButton.snp.bottom).offset(4)
            make.leading.equalTo(14)
        }
        
        secondAgreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstAgreeLabel.snp.bottom).offset(23)
            make.leading.equalTo(secondCheckButton.snp.trailing).offset(6)
        }
        
        secondMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(firstMoreButton.snp.bottom).offset(7)
            make.trailing.equalTo(-4)
        }
        
        thirdCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(secondCheckButton.snp.bottom).offset(4)
            make.leading.equalTo(14)
        }
        
        thirdAgreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondAgreeLabel.snp.bottom).offset(23)
            make.leading.equalTo(thirdCheckButton.snp.trailing).offset(6)
        }
        
        thirdMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(secondMoreButton.snp.bottom).offset(7)
            make.trailing.equalTo(-4)
        }
        
        fourthCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdCheckButton.snp.bottom).offset(4)
            make.leading.equalTo(14)
        }
        
        fourthAgreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(thirdAgreeLabel.snp.bottom).offset(23)
            make.leading.equalTo(fourthCheckButton.snp.trailing).offset(6)
        }
        
        smsCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourthAgreeLabel.snp.bottom).offset(14)
            make.leading.equalTo(50)
        }
        
        smsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fourthAgreeLabel.snp.bottom).offset(25)
            make.leading.equalTo(smsCheckButton.snp.trailing).offset(6)
        }
        
        emailCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(fourthAgreeLabel.snp.bottom).offset(14)
            make.leading.equalTo(smsLabel.snp.trailing).offset(90)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fourthAgreeLabel.snp.bottom).offset(27)
            make.leading.equalTo(emailCheckButton.snp.trailing).offset(9)
        }
        
        eventImageView.snp.makeConstraints { (make) in
            make.top.equalTo(smsLabel.snp.bottom).offset(5)
            make.leading.equalTo(50)
        }
        
        ageCheckButton.snp.makeConstraints { (make) in
            make.top.equalTo(eventImageView.snp.bottom).offset(6)
            make.leading.equalTo(14)
        }
        
        ageAgreeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eventImageView.snp.bottom).offset(17)
            make.leading.equalTo(ageCheckButton.snp.trailing).offset(6)
        }
        
        joinButton.snp.makeConstraints { (make) in
            make.top.equalTo(ageCheckButton.snp.bottom).offset(21)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        

    }
    
    // MARK: - Function
        
    // 동의 버튼
    @objc func selectOption(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    // 전체 동의 버튼
    @objc func pressTermCheckButton(_ sender: UIButton) {
        if sender.isSelected {
            termCheckButton.isSelected = false
            firstCheckButton.isSelected = false
            secondCheckButton.isSelected = false
            thirdCheckButton.isSelected = false
            fourthCheckButton.isSelected = false
            smsCheckButton.isSelected = false
            emailCheckButton.isSelected = false
            ageCheckButton.isSelected = false
            
        } else {
            termCheckButton.isSelected = true
            firstCheckButton.isSelected = true
            secondCheckButton.isSelected = true
            thirdCheckButton.isSelected = true
            fourthCheckButton.isSelected = true
            smsCheckButton.isSelected = true
            emailCheckButton.isSelected = true
            ageCheckButton.isSelected = true
            
        }
        
    }
    
    // 회원가입 버튼
    @objc func joinAction(_ sender: UIButton) {

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
                    print(msg)

                }

            case .requestErr(let msg):
                if let msg = msg as? String {
                    print(msg)
                }

            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }

        }

    }
    
    // 화면 터치 시에 키보드 dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

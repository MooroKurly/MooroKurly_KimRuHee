//
//  JoinFirstTableView.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import UIKit

class JoinFirstTableView: UIView {
    
    var gender = String()
    
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
            tf.placeholder = "아이디를 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.text = "yeseul"
            tf.placeholderPadding()
        }
    
    var checkButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnDoublecheck"), for: .normal)
            btn.addTarget(self, action: #selector(pressCheckButton(_:)), for: .touchUpInside)
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
            tf.placeholder = "비밀번호를 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholderPadding()
            tf.text = "1234"
            tf.isSecureTextEntry = true
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
            tf.placeholder = "비밀번호를 한번 더 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholderPadding()
            tf.text = "1234"
            tf.isSecureTextEntry = true
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
            tf.placeholder = "이름을 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.text = "예슬"
            tf.placeholderPadding()
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
            tf.placeholder = "예: marketkurly@kurly.com"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.text = "yeseul@mooro.com"
            tf.placeholderPadding()
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
            tf.placeholder = "숫자만 입력해주세요"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholderPadding()
            tf.keyboardType = .numberPad
            tf.text = "01012341234"
            tf.addDoneButtonOnKeyboard()
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
    
    var addressTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.placeholder = "도로명, 지번, 건물명 검색"
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.text = "서울시 종로구"
            tf.placeholderPadding()
        }
    
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
    
    var birthdayBoxView : UIView = UIView().ductTape
        .reinforce { (view) in
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            view.layer.cornerRadius = 5.0
            view.backgroundColor = .white
        }
    
    var birthTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.layer.borderWidth = 1.0
            tf.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            tf.layer.cornerRadius = 5.0
            tf.placeholder = "YYYY / MM / YY"
            tf.font = .systemFont(ofSize: 16, weight: .semibold)
            tf.textAlignment = .center
            tf.keyboardType = .numberPad
            tf.text = "1998-04-25"
            tf.addDoneButtonOnKeyboard()
        }
    
    var yearTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .none
            tf.placeholder = "YYYY"
            tf.font = .systemFont(ofSize: 16, weight: .semibold)
            tf.textAlignment = .center
            tf.keyboardType = .numberPad
            tf.addDoneButtonOnKeyboard()
        }
    
    var monthTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .none
            tf.placeholder = "MM"
            tf.font = .systemFont(ofSize: 16, weight: .semibold)
            tf.textAlignment = .center
            tf.keyboardType = .numberPad
            tf.addDoneButtonOnKeyboard()
        }
    
    var dayTextField : UITextField = UITextField().ductTape
        .reinforce { (tf) in
            tf.borderStyle = .none
            tf.placeholder = "DD"
            tf.font = .systemFont(ofSize: 16, weight: .semibold)
            tf.textAlignment = .center
            tf.keyboardType = .numberPad
            tf.addDoneButtonOnKeyboard()
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
            btn.addTarget(self, action: #selector(pressBoyButton(_:)), for: .touchUpInside)
        }
    
    var boyLabel : UILabel = UILabel().ductTape
        .text("남자")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var girlToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(pressGirlButton(_:)), for: .touchUpInside)
        }
    
    var girlLabel : UILabel = UILabel().ductTape
        .text("여자")
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    var noToggleButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnToggleOff"), for: .normal)
            btn.setImage(UIImage(named: "btnToggleOn"), for: .selected)
            btn.addTarget(self, action: #selector(pressNoButton(_:)), for: .touchUpInside)
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
        
        
        idTextField.delegate = self
        pwTextField.delegate = self
        pwCheckTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        addressTextField.delegate = self
        
        yearTextField.delegate = self
        monthTextField.delegate = self
        dayTextField.delegate = self
        
            
        addSubviews(idLabel, idTextField, checkButton,
                    pwLabel, pwTextField, pwCheckLabel, pwCheckTextField,
                    nameLabel, nameTextField, emailLabel, emailTextField,
                    phoneLabel, phoneTextField, getNumberButton,
                    addressLabel, addressTextField, addressInfoLabel,
                    birthdayLabel, birthTextField, sexLabel,
                    boyToggleButton, boyLabel, girlToggleButton, girlLabel,
                    noToggleButton, noLabel, alphaLabel,
                    recommToggleButton, recommIDLabel, eventToggleButton, eventLabel)
                
        birthdayBoxView.addSubviews(yearTextField, monthTextField, dayTextField)
        
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
            make.width.equalTo(240)
            make.height.equalTo(48)
            
        }
        
        getNumberButton.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.trailing.equalTo(-20)
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(21)
            make.leading.equalTo(20)
        }
        
        addressTextField.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
        
        addressInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressTextField.snp.bottom).offset(9)
            make.leading.equalTo(20)
        }
        
        birthdayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressInfoLabel.snp.bottom).offset(25)
            make.leading.equalTo(20)
        }
        
        birthTextField.snp.makeConstraints { (make) in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(48)
        }
        
//        yearTextField.snp.makeConstraints { (make) in
//            make.top.leading.bottom.equalToSuperview()
//            make.height.equalTo(48)
//            make.width.equalTo(108)
//        }
//
//        monthTextField.snp.makeConstraints { (make) in
//            make.top.bottom.equalToSuperview()
//            make.leading.equalTo(yearTextField.snp.trailing)
//            make.trailing.equalTo(dayTextField.snp.leading)
//            make.height.equalTo(48)
//        }
//
//        dayTextField.snp.makeConstraints { (make) in
//            make.top.bottom.trailing.equalToSuperview()
//            make.height.equalTo(48)
//            make.width.equalTo(108)
//        }
        
        sexLabel.snp.makeConstraints { (make) in
            make.top.equalTo(birthTextField.snp.bottom).offset(24)
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
    
    // 중복 확인 버튼
    
    @objc func pressCheckButton(_ sender: UIButton) {
        
        IdCheckService.shared.idCheck(id: idTextField.text!) { (result) in
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
    
    // 남자 선택 버튼
    @objc func pressBoyButton(_ sender: UIButton) {
        boyToggleButton.isSelected = true
        girlToggleButton.isSelected = false
        noToggleButton.isSelected = false
        gender = "남"
    }
    
    // 여자 선택 버튼
    @objc func pressGirlButton(_ sender: UIButton) {
        boyToggleButton.isSelected = false
        girlToggleButton.isSelected = true
        noToggleButton.isSelected = false
        gender = "여"
    }
    
    // 선택안함 버튼
    @objc func pressNoButton(_ sender: UIButton) {
        boyToggleButton.isSelected = false
        girlToggleButton.isSelected = false
        noToggleButton.isSelected = true
        gender = "선택안함"
    }
    
    @objc func selectOption(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
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

// MARK: - UITextFieldDelegate

extension JoinFirstTableView : UITextFieldDelegate {
    
    // 생년월일 텍스트 필드 부분 글자 수 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == yearTextField {
            
            // ( 기존 텍스트 필드의 텍스트 + 새로 입력할 텍스트 - 지워질 글자 개수 ) 가 지정한 값을 넘지 말아야 함
            let yearLength = yearTextField.text!.count + string.count - range.length
            return !(yearLength > 4)
            
        } else if textField == monthTextField {
            
            let monthLength = monthTextField.text!.count + string.count - range.length
            return !(monthLength > 2)
            
        } else if textField == dayTextField {
            
            let dayLength = dayTextField.text!.count + string.count - range.length
            return !(dayLength > 2)
            
        } else if textField == idTextField {
            
            let idLength = idTextField.text!.count + string.count - range.length
            return !(idLength > 16)
            
        } else if textField == pwTextField {
            
            let pwLength = pwTextField.text!.count + string.count - range.length
            return !(pwLength > 16)
            
        } else if textField == pwCheckTextField {
            
            let pwCheckLength = pwCheckTextField.text!.count + string.count - range.length
            return !(pwCheckLength > 16)
        }
        return true
    }
    
    // return 누르면 발생되는 이벤트 관련 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        
        // 키보드에서 return 버튼 누르면 그 다음 텍스트필드로 커서 이동
        case idTextField:
            pwTextField.becomeFirstResponder()
         
        case pwTextField:
            pwCheckTextField.becomeFirstResponder()
            
        case pwCheckTextField:
            nameTextField.becomeFirstResponder()
            
        case nameTextField:
            emailTextField.becomeFirstResponder()
            
        case emailTextField:
            phoneTextField.becomeFirstResponder()
            
        case phoneTextField:
            addressTextField.becomeFirstResponder()
            
        case addressTextField:
            birthTextField.becomeFirstResponder()
            
        // 여기는 dayTextField가 마지막이니까 return 누르면 키보드 dismiss
        default:
            birthTextField.resignFirstResponder()
            
        }
        return true
    }
    
    
    // textField 선택하면 검정색으로 변경시켜주기 위한 함수
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            idTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case pwTextField:
            pwTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case pwCheckTextField:
            pwCheckTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case nameTextField:
            nameTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case emailTextField:
            emailTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case phoneTextField:
            phoneTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        case addressTextField:
            addressTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
            
        default:
            birthTextField.layer.borderColor = UIColor.kurlyBlack.cgColor
        }
        
    }
    
    // textField 선택 끝나면 다시 회색으로 돌아오기 위한 함수
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            idTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case pwTextField:
            pwTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case pwCheckTextField:
            pwCheckTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case nameTextField:
            nameTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case emailTextField:
            emailTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case phoneTextField:
            phoneTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        case addressTextField:
            addressTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        default:
            birthTextField.layer.borderColor = UIColor.kurlyBorderColor.cgColor
            
        }
    }
    
}



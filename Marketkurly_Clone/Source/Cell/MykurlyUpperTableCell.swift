//
//  MykurlyUpperTableCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

import DuctTape

class MykurlyUpperTableCell: UITableViewCell {

    static let identifier = "MykurlyUpperTableCell"

    // MARK: - Property
    
    let joinLabel : UILabel = UILabel().ductTape
        .text("회원 가입하고\n다양한 헤택을 받아보세요!")
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 18, weight: .semibold))
        .numberOfLines(0)
        .textAlignment(.center)
    
    let joinEventButton : UILabel = UILabel().ductTape
        .text("가입 혜택 보기 >")
        .textColor(.kurlyTextGray)
        .font(.systemFont(ofSize: 14, weight: .semibold))
    
    let joinButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnJoin"), for: .normal)
        }

    
    // MARK: - UI
    
    func configureUI() {
        
        addSubview(joinLabel)
        addSubview(joinEventButton)
        addSubview(joinButton)
        
        joinLabel.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.centerX.equalToSuperview()
        }
        
        joinEventButton.snp.makeConstraints { (make) in
            make.top.equalTo(joinLabel.snp.bottom).offset(11)
            make.centerX.equalToSuperview()
        }
        
        joinButton.snp.makeConstraints { (make) in
            make.top.equalTo(joinEventButton.snp.bottom).offset(31)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

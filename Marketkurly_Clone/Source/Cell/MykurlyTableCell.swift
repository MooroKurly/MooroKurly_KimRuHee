//
//  MykurlyTableCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/17.
//

import UIKit

class MykurlyTableCell: UITableViewCell {
    
    static let identifier = "MykurlyTableCell"

    // MARK: - Property
    
    let menuLabel : UILabel = UILabel().ductTape
        .textColor(.kurlyBlack)
        .font(.systemFont(ofSize: 16, weight: .semibold))
    
    let gomenuButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnGomenu"), for: .normal)
        }
    
    let lineView : UIView = UIView().ductTape
        .backgroundColor(.kurlyLightGray)

    
    // MARK: - UI
    
    func configureUI() {
        
        addSubview(menuLabel)
        addSubview(gomenuButton)
        addSubview(lineView)
        
        menuLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        gomenuButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(0)
            make.centerY.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
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

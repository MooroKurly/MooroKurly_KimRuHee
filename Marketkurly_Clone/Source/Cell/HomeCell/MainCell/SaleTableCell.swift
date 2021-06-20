//
//  SaleTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class SaleTableCell: UITableViewCell {
    
    static let identifier = "SaleTableCell"
    
    //MARK: - Property
    
    let saleLabel : UILabel = {
        let label = UILabel()
        label.text = "특가/혜택"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let seemoreButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonSeemore"), for: .normal)
        return button
    }()
    
    //MARK: - UI 관련
    
    func configureUI() {
        
       
        addSubview(saleLabel)
        addSubview(seemoreButton)
        
        saleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(29)
            make.leading.equalTo(16)
        }
        
        seemoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.leading.equalTo(saleLabel.snp.trailing).offset(7)
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

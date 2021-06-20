//
//  CateUpperTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/06.
//

import UIKit

class CateUpperTableCell: UITableViewCell {
    
    static let identifier = "CateUpperTableCell"
    
    //MARK: - Property
    
    let menuLabel : UILabel = UILabel().ductTape
        .text("자주 사는 상품 ")
        .textColor(.kurlyPurple)
        .font(.systemFont(ofSize: 14, weight: .bold))
    
    let goButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnMore"), for: .normal)
        }
    
    //MARK: - UI
    
    func configureUI() {
        
        addSubview(menuLabel)
        addSubview(goButton)
        
        menuLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(24)
        }
        
        goButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(0)
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

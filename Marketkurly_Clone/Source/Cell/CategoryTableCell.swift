//
//  CategoryTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

import DuctTape
import SnapKit

class CategoryTableCell: UITableViewCell {
    
    static let identifier = "CategoryTableCell"
    
    //MARK: - Property
    
    let bookmarkImage : UIImageView = UIImageView().ductTape
        .image(UIImage(named: "icBookmark"))
    
    let menuNameLabel : UILabel = UILabel().ductTape
        .font(.systemFont(ofSize: 14, weight: .medium))
        .text("채소")
        .textColor(.kurlyBlack)
    
    let openButton : UIButton = UIButton().ductTape
        .reinforce { (btn) in
            btn.setImage(UIImage(named: "btnOpenMore"), for: .normal)
        }
    

    //MARK: - UI
    
    func configureUI() {
        
        addSubview(bookmarkImage)
        addSubview(menuNameLabel)
        addSubview(openButton)
        
        bookmarkImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
//            make.width.equalTo(12)
//            make.height.equalTo(16)
        }
        
        menuNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(bookmarkImage.snp.trailing).offset(10)
        }
        
        openButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(0)
        }
        
    }
    
    //MARK: - setData
    
    func setData(name: String) {
        
        menuNameLabel.text = name
        
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

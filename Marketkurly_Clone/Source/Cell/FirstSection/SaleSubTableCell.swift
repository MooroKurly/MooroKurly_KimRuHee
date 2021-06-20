//
//  SaleSubTableCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import UIKit

class SaleSubTableCell: UITableViewCell {
    
    static let identifier = "SaleSubTableCell"
    
    // MARK: - Property
    
    let saleImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let saleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let saleSubLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .kurlyTextGray
        return label
    }()
    
    // MARK: - UI
    
    func configureUI() {
        
        addSubview(saleImage)
        addSubview(saleLabel)
        addSubview(saleSubLabel)
        
        saleImage.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(16)
        }
        
        saleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(28)
            make.leading.equalTo(saleImage.snp.trailing).offset(20)
        }
        
        saleSubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(saleLabel.snp.bottom).offset(6)
            make.leading.equalTo(saleImage.snp.trailing).offset(20)
        }
    }
    
    // MARK: - setData
    
    func setData(imageName : String, sale : String, subName : String) {
        
        if let image = URL(string: imageName) {
            saleImage.kf.setImage(with: image)
        }
        
        saleLabel.text = sale
        saleSubLabel.text = subName
        
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

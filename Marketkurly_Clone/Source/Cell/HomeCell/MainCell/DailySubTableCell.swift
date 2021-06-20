//
//  DailySaleTableCell.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/28.
//

import UIKit

class DailySubTableCell: UITableViewCell {
    
    static let identifier = "DailySubTableCell"
    
    //MARK: - Property
    
    let dailyLabel : UILabel = {
        let label = UILabel()
        label.text = "일일특가"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let dailysubLabel : UILabel = {
        let label = UILabel()
        label.text = "24시간 한정 특가"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let dailyTV = UITableView()
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        addSubview(dailyLabel)
        addSubview(dailysubLabel)
        
        dailyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(38)
            make.leading.equalTo(16)
        }
        
        dailysubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dailyLabel.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}



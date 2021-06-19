//
//  JoinTableCell.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/18.
//

import UIKit

class JoinTableCell: UITableViewCell {
    
    static let identifier = "JoinTableCell"
    
    // MARK: - Property
    
    var firstView = JoinFirstTableView()
    
    var secondView = JoinSecondTableView()
    
        
    // MARK: - UI
    
    func configureFirstCellUI() {
        
        addSubview(firstView)
        
        firstView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    func configureSecondCellUI() {
        
        addSubview(secondView)
        
        secondView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
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

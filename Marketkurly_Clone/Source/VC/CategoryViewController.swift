//
//  CategoryViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

import DuctTape

class CategoryViewController: UIViewController {
    
    //MARK: - Property
    
    var headerView : TopHeaderView = TopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "카테고리"
        }
    
    var cateTV : UITableView = UITableView().ductTape
        .backgroundColor(.white)
        .reinforce { (tv) in
            tv.register(CategoryTableCell.self, forCellReuseIdentifier: "CategoryTableCell")
        }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cateTV.delegate = self
        cateTV.dataSource = self

        configureUI()
    }
    

    //MARK: - configureUI
    
    func configureUI() {
        
        view.addSubview(headerView)
        view.addSubview(cateTV)
        
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        cateTV.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        
    }

}

extension CategoryViewController : UITableViewDelegate {
    
}

extension CategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath)
                as? CategoryTableCell else { return UITableViewCell() }
        
        cell.backgroundColor = .black
        return cell
    }
    
    
}

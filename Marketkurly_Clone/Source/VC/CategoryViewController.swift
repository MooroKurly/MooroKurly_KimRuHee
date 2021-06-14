//
//  CategoryViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

import DuctTape

class CategoryViewController: UIViewController {
    
    var menuListArray = ["채소", "과일·견과·쌀", "수산·해물·건어물", "정육·계란",
                         "국·반찬·메인요리", "샐러드·간편식", "면·양념·오일",
                         "음료·우유·떡·간식", "베이커리·치즈·델리",
                         "건강식품", "생활용품·리빙"]
    //MARK: - Property
    
    var headerView : TopHeaderView = TopHeaderView().ductTape
        .reinforce { (view) in
            view.headerTitleLabel.text = "카테고리"
        }
    
    var cateTV : UITableView = UITableView(frame: .zero, style: .grouped).ductTape
        .backgroundColor(.white)
        .reinforce { (tv) in
            tv.register(CateUpperTableCell.self, forCellReuseIdentifier: "CateUpperTableCell")
            tv.register(CategoryTableCell.self, forCellReuseIdentifier: "CategoryTableCell")
            tv.separatorStyle = .none
            
        }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cateTV.delegate = self
        cateTV.dataSource = self
        
        cateTV.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat.leastNormalMagnitude))
        cateTV.sectionFooterHeight = 0

        
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
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 49
        default:
            return 51

        }
    }
    
}

extension CategoryViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = UIView()
            view.backgroundColor = UIColor.kurlyLightGray
            return view
        default:
            let view = UIView()
            view.backgroundColor = UIColor.kurlyLightGray
            return view
        }
    }

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return menuListArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CateUpperTableCell", for: indexPath)
                    as? CateUpperTableCell else { return UITableViewCell() }
        
            cell.selectionStyle = .none
            cell.configureUI()
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath)
                    as? CategoryTableCell else { return UITableViewCell() }
            
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.configureUI()
            cell.setData(name: menuListArray[indexPath.row])
            return cell
        }
        
    }
    
}

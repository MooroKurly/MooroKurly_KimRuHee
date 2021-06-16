//
//  CategoryViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/06/03.
//

import UIKit

import DuctTape

class Section {
    let title : String
    let options : [String]
    var isOpened : Bool = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class CategoryViewController: UIViewController {
    
    var sections = [
        Section(title: "채소", options: ["전체보기", "친환경", "고구마·감자·당근", "콩나물·버섯"].compactMap({ return "\($0)" })),
        Section(title: "과일·견과·쌀", options: ["전체보기", "친환경", "제철과일", "국산과일", "수입과일", "간편과일"].compactMap({ return "\($0)" })),
        Section(title: "수산·해물·건어물", options: ["제철수산", "생선류", "수산가공품"].compactMap({ return "\($0)" })),
        Section(title: "정육·계란", options: ["전체보기", "국내산 소고기", "수입산 소고기", "양고기"].compactMap({ return "\($0)" })),
        Section(title: "국·반찬·메인요리", options: ["전체보기", "국·탕·찌개", "밀키트·메인요리", "밑반찬", "김치·젓갈·장류"].compactMap({ return "\($0)" })),
        Section(title: "샐러드·간편식", options: ["전체보기", "샐러드·닭가슴살", "도시락·밥류", "파스타·면류", "죽·스프·카레", "선식·시리얼"].compactMap({ return "\($0)" })),
        Section(title: "면·양념·오일", options: ["전체보기", "파스타·면류", "식초·소스·드레싱", "양념·액젓·장류"].compactMap({ return "\($0)" })),
        Section(title: "음료·우유·떡·간식", options: ["전체보기", "유제품", "떡", "과자류"].compactMap({ return "\($0)" })),
        Section(title: "베이커리·치즈·델리", options: ["전체보기", "베이커리", "치즈류", "과자류"].compactMap({ return "\($0)" })),
        Section(title: "건강식품", options: ["전체보기", "영양제", "유산균", "건강분말", "홍삼", "유아동"].compactMap({ return "\($0)" })),
        Section(title: "생활용품·리빙", options: ["전체보기", "휴지", "의약외품", "생활잡화·문구", "캠핑용품"].compactMap({ return "\($0)" }))
    ]

    
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

//MARK: - UITableViewDelegate

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


//MARK: - UITableViewDataSource

extension CategoryViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 10
        case 1:
            return 10
        default:
            return 0
        }

    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = UIView()
            view.backgroundColor = UIColor.kurlyLightGray
            return view
            
        case 1:
            let view = UIView()
            view.backgroundColor = UIColor.kurlyLightGray
            return view
            
        default:
            return UIView()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let secondSection = sections[section]
        
        if section == 0 {
            return 1
            
        } else {
            if secondSection.isOpened {
                return secondSection.options.count + 1
            } else {
                return 1
            }
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
            
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath)
                        as? CategoryTableCell else { return UITableViewCell() }
                
                cell.backgroundColor = .white
                cell.selectionStyle = .none
                cell.configureUI()
                cell.menuNameLabel.font = .systemFont(ofSize: 14, weight: .regular)
                cell.menuNameLabel.textColor = .kurlyBlack
                cell.bookmarkImage.isHidden = false
                cell.openButton.isHidden = false
                cell.setData(name: sections[indexPath.section].title)
                
                return cell
                
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath)
                        as? CategoryTableCell else { return UITableViewCell() }
                
                cell.backgroundColor = .kurlyLightGray
                cell.selectionStyle = .none
                cell.configureUI()
                cell.bookmarkImage.isHidden = true
                cell.openButton.isHidden = true
                cell.menuNameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
                cell.menuNameLabel.textColor = .darkGray
                cell.isUserInteractionEnabled = false
                cell.setData(name: sections[indexPath.section].options[indexPath.row - 1])
                
                return cell
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
        tableView.reloadSections([indexPath.section], with: .fade)
        
    }

}

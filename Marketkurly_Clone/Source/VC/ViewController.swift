//
//  ViewController.swift
//  Marketkurly_Clone
//
//  Created by 김루희 on 2021/05/19.
//

import UIKit

import DuctTape
import SnapKit
import Then

class ViewController: UIViewController {
    
    var saleList = [
        SaleDataModel(saleImageName: "imgDailysale", saleTime: "17:04:11",
                      saleFoodName: "[Kurly’s] 간편하게 바삭, 통등심 돈까스",
                      salePercent: "33%", salePrice: "3,819원"),
        
        SaleDataModel(saleImageName: "imgDailysale", saleTime: "22:19:47",
                      saleFoodName: "[Kurly’s] 물로 칼베기 컬리즈",
                      salePercent: "56%", salePrice: "8,376원")
    ]
    
    //MARK: - Property
    
    let upperView : UIView = {
        let view = UIView()
        view.backgroundColor = .kurlyPurple
        return view
    }()
    
    let logoImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iconLogo")
        return image
    }()
    
    let mapButton : UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "buttonMap"), for: UIControl.State.normal)
        return btn
    }()
    
    let cartButton : UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "buttonCart"), for: UIControl.State.normal)
        return btn
    }()
    
    let menuView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let mainTV = UITableView(frame: CGRect.zero, style: .grouped)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureUI()
        
        mainTV.delegate = self
        mainTV.dataSource = self
        mainTV.separatorStyle = .none
        
        // 푸터 추가하고 나서 생긴 오류를 해결하는 코드 -> 이유가 뭘까?
        mainTV.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat.leastNormalMagnitude))
        mainTV.sectionHeaderHeight = 0
        
//        UINavigationController.init(rootViewController: ViewController)
        
        
        // section == 0 에 해당하는 cell
        mainTV.register(BannerTableCell.self, forCellReuseIdentifier: "BannerTableCell")
        mainTV.register(ProductTableCell.self, forCellReuseIdentifier: "ProductTableCell")
        mainTV.register(SaleTableCell.self, forCellReuseIdentifier: "SaleTableCell")
        mainTV.register(DailySubTableCell.self, forCellReuseIdentifier: "DailySubTableCell")
        mainTV.register(DailySaleTableCell.self, forCellReuseIdentifier: "DailySaleTableCell")
        
        // section == 1 에 해당하는 cell
        mainTV.register(RegretPriceTableCell.self, forCellReuseIdentifier: "RegretPriceTableCell")
    }
    
    //MARK: - UI 관련
    
    func configureUI() {
        
        view.addSubview(upperView)
        view.addSubview(logoImage)
        view.addSubview(mapButton)
        view.addSubview(cartButton)
        view.addSubview(menuView)
        
        view.addSubview(mainTV)
        
        
        
        // 상단 로고 uiview
        upperView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(42)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        mapButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(52)
            make.trailing.equalTo(cartButton.snp.leading).offset(-14)
        }
        
        cartButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        // custom tabbar
        menuView.snp.makeConstraints { (make) in
            make.top.equalTo(upperView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        // tabbar 아래 tableView..
        mainTV.snp.makeConstraints { (make) in
            make.top.equalTo(menuView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        

    }
}


//MARK: - UITableViewDelegate

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 340
                
            } else if indexPath.row == 1 {
                return 371
                
            } else if indexPath.row == 2 {
                return 406
                
            } else if  indexPath.row == 3 {
                return 93
                
            } else {
                return 250
                
            }
            
        default:
            return 371
            
        }
    }
    
    // tableView footer
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat()

        default:
            return 353
        }
    }
    
}




//MARK: - UITableViewDataSource

extension ViewController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 6
            
        default:
            return 1
            
        }
            
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 { // 배너 관련 셀
                guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableCell", for: indexPath)
                        as? BannerTableCell else { return UITableViewCell() }
                
                bannerCell.configureUI()
                
                return bannerCell
                
            } else if indexPath.row == 1 { // 이 상품 어때요 셀
                guard let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell", for: indexPath)
                        as? ProductTableCell else { return UITableViewCell() }
                
                productCell.selectionStyle = .none
                productCell.configureUI()
                
                return productCell
                
            } else if indexPath.row == 2 { // 특가/혜택 셀
                guard let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableCell", for: indexPath)
                        as? SaleTableCell else { return UITableViewCell() }
                
                saleCell.backgroundColor = UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
                
                saleCell.selectionStyle = .none
                saleCell.configureUI()
                
                return saleCell
                
            } else if indexPath.row == 3 { // 일일특가에서 제목부분 ( 24시간 한정 특가 ) 셀
                guard let dailysubCell = tableView.dequeueReusableCell(withIdentifier: "DailySubTableCell", for: indexPath)
                        as? DailySubTableCell else { return UITableViewCell() }
                
                dailysubCell.selectionStyle = .none
                dailysubCell.configureUI()
                return dailysubCell
                
            } else { // 일일특가 상세 셀
                guard let dailyCell = tableView.dequeueReusableCell(withIdentifier: "DailySaleTableCell", for: indexPath)
                        as? DailySaleTableCell else { return UITableViewCell() }
                
                dailyCell.selectionStyle = .none
                dailyCell.configureUI()
                dailyCell.setData(imageName: saleList[indexPath.row-4].saleImageName,
                                  time: saleList[indexPath.row-4].saleTime,
                                  name: saleList[indexPath.row-4].saleFoodName,
                                  percent: saleList[indexPath.row-4].salePercent,
                                  price: saleList[indexPath.row-4].salePrice)
                
                return dailyCell
                
            }
            
        case 1:
            
            if indexPath.row == 0 {
                guard let regretCell = tableView.dequeueReusableCell(withIdentifier: "RegretPriceTableCell", for: indexPath)
                        as? RegretPriceTableCell else { return UITableViewCell() }
                
                regretCell.selectionStyle = .none
                regretCell.configureUI()
                
                return regretCell
                
            } else {
                return UITableViewCell()
            }
            
        default:
            return UITableViewCell()
            
        }
    }
    

    // footer 넣기
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return UIView()

        default:
            let footer = TableFooterView()
            footer.backgroundColor = UIColor.kurlyBackgroundGray
            return footer
        }
    }
    
    
}

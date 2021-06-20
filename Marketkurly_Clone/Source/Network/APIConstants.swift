//
//  APIConstants.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/18.
//

import Foundation

struct APIConstants {
    
    // baseURL
    static let baseURL = "http://3.139.195.175:5000"
    
    // 로그인 URL
    static let loginURL = baseURL + "/users/signin"
    
    // 회원가입 URL
    static let joinURL = baseURL + "/users/signup"
    
    // 아이디 체크 URL
    static let idCheckURL = baseURL + "/users/id-check"
    
    // 광고 배너 URL
    static let bannerURL = baseURL + "/main/banners"
    
    // 특가+혜택 URL
    static let specialURL = baseURL + "/main/specialPrice"
    
    // 나머지 메인 뷰 URL
    static let foodURL = baseURL + "/main/sales?id="
}

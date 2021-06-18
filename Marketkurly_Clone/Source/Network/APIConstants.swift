//
//  APIConstants.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/18.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "http://3.139.195.175:5000"
    
    // 로그인 URL
    static let loginURL = baseURL + "/users/signin"
    
    // 회원가입 URL
    static let joinURL = baseURL + "/users/signup"
}

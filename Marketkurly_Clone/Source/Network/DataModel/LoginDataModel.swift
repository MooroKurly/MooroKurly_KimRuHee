//
//  LoginDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/18.
//

import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let msg, token: String
    
    enum CodingKeys: String, CodingKey {
        case msg, token
    }
}

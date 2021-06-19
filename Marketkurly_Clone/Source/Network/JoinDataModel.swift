//
//  JoinDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import Foundation

// MARK: - JoinDataModel
struct JoinDataModel: Codable {
    let msg, token: String
    
    enum CodingKeys: String, CodingKey {
        case msg, token
    }
}


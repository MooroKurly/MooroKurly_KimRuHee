//
//  idCheckDataModel.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/20.
//

import Foundation

// MARK: - idCheckDataModel
struct idCheckDataModel: Codable {
    let msg: String
    let isValid: Bool
    
    enum CodingKeys: String, CodingKey {
        case msg, isValid
    }
}

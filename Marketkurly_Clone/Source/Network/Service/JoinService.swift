//
//  JoinService.swift
//  Marketkurly_Clone
//
//  Created by Thisisme Hi on 2021/06/19.
//

import Foundation
import Alamofire

struct JoinService {
    
    static let shared = JoinService()
    
    private func makeParameter(id : String, password: String, name: String,
                               email: String, phone: String, address: String,
                               birth: String, gender: String) -> Parameters {
        
        return ["id" : id, "password" : password, "name" : name, "email" : email,
                "phone" : phone, "address" : address,
                "birth" : birth, "gender" : gender]
    }
    
    func join(id : String, password : String,
              name : String, email : String,
              phone : String , address : String,
              birth : String, gender : String,
              completion : @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.joinURL
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .post,
                                     parameters: makeParameter(id: id,
                                                               password: password,
                                                               name: name,
                                                               email: email,
                                                               phone: phone,
                                                               address: address,
                                                               birth: birth,
                                                               gender: gender),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    private func judgeStatus(by statusCode : Int, _ data : Data) -> NetworkResult<Any> {
        
        dump(data)
        let decoder = JSONDecoder()
       
        
        guard let decodedData = try? decoder.decode(JoinDataModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200: return .success(decodedData.msg)
        case 400: return .requestErr(decodedData.msg)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}

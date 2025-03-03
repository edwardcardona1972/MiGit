//
//  NetworkingProvider.swift
//  Networking
//
//  Created by Eduard Alexis Cardona Grajales on 2/3/25.
//

import Foundation
import Alamofire



final class NetworkingProvider {
    
    
    static let shared = NetworkingProvider()
    
    private let kBaseURL = "https://gorest.co.in/public-api/"
    
    private let kStatusOk = 200...299
    
    private let kToken = "5efa1350724cb10e0d3cc387461d75f42a27599c704a5f53de4a04a0c1cea884"
    
    func getUser(id: Int, success: @escaping (User) -> Void, failure: @escaping (Error) -> ()){
        
        let url = "\(kBaseURL)users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) {response in
            
            if let user = response.value?.data{
                success(user)
            }else{
                failure(response.error!)
                }
            }
        }
        func addUser(user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
            
            let url = "\(kBaseURL)users/"
            
            let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
            
            AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) {response in
                
                if let user = response.value?.data, user.id != nil{
                    success(user)
                }else{
                    failure(response.error)
                }
            }
        }
    func updateUser(id: Int, user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        let url = "\(kBaseURL)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) {response in
            
            if let user = response.value?.data, user.id != nil{
                success(user)
            }else{
                failure(response.error)
            }
        }
    }
}

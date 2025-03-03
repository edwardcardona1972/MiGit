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
    
    func getUser(id: Int){
        
        let url = "\(kBaseURL)users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) {response in
            
            if let user = response.value?.data{
                print(user)
           //     print(user.email)
            }else{
                print(response.error?.responseCode  ?? "No data")
            }
        }
        
    }
}

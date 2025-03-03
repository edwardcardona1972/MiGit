//
//  DateDecode.swift
//  Networking
//
//  Created by Eduard Alexis Cardona Grajales on 2/3/25.
//

import Foundation

final class DateDecoder: JSONDecoder {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        //  created_at":"2020-10-10T03:50:06.151+05:30",
        //  "update_at":"2020-10-10T03:50:06.151+05:30"
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}

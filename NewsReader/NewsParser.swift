//
//  NewsParser.swift
//  NewsReader
//
//  Created by Egor on 08.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NewsParser {
    
    static func parse(url: URL, completion: ((Data?) -> Void)? = nil) {
        
        AF.request(url, method: .get).response { (response) in
            switch (response.result) {
            case .success:
                guard let data = response.data else{return}
                completion?(data)
                break;
                
            case .failure (let error):
                completion?(nil)
                print("Case a error \(error.localizedDescription)")
                break;
            }
        }
    }
}

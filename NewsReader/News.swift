//
//  Articles.swift
//  NewsReader
//
//  Created by Egor on 08.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct News: Decodable {
    var articles: [Article]
    
//    init?(json: JSON) {
//        guard  let author = json["author"].string ?? "Unexpected author",
//        let title = json["title"].string,
//        let url = json["url"].string,
//        let urlToImage = json["urlToImage"].string
//        else {return nil}
//
//        self.author = author
//        self.title = title
//        self.url = url
//        self.urlToImage = urlToImage
//    }
}
struct Article: Decodable {
    var source: Source
    var author: String?
    var title: String?
    var url: String?
    var urlToImage: String?
}
struct Source: Decodable {
    var name: String?
}

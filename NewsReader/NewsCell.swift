//
//  NewsCell.swift
//  NewsReader
//
//  Created by Egor on 07.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var background: BackgroundForCell!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postAuthor: UILabel!
    
    let cornerRadiusForImage: CGFloat = 5.0
    let defaultImageColor: UIColor = UIColor.gray
    
    var imageURL: URL?{
        didSet{
            self.postImage.image = nil
            updateImg()
        }
    }
    
    // Завгрузка img
    func updateImg(){
        if let url = imageURL{
            DispatchQueue.main.async {
                if let imgData = try? Data(contentsOf: url){
                    self.postImage.layer.cornerRadius = self.cornerRadiusForImage
                    self.postImage.image = UIImage(data: imgData)
                }
            }
        }else{
            postImage.backgroundColor = defaultImageColor
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageURL = nil
    }
}

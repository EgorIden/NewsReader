//
//  BackgroundForCell.swift
//  NewsReader
//
//  Created by Egor on 07.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

// Стиль ячейки
class BackgroundForCell: UIView {
    let cornerRadius: CGFloat = 4.0
    let shadowColor: UIColor = UIColor.black
    let shadowOffSetWidth: Int = 0
    let shadowOffSetHeight: Int = 5
    let shadowOpacity: Float = 0.12
    
    func setBackgroundForView() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}

//
//  BgUiVIew.swift
//  NewsReader
//
//  Created by Egor on 07.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class BackgroungForCell: UIView {

    let cornerRadius: CGFloat = 10.0
    let shadowColor: UIColor = UIColor.black
    let shadowOffSetWidth: Int = 0
    let shadowOffSetHeight: Int = 4
    let shadowOpacity: Float = 0.4
    
    func setBgView() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}

//
//  CustomCorners.swift
//  E-Commerce
//
//  Created by gorbyno sitepu on 17/05/22.
//

import SwiftUI

struct CustomCorners: Shape {
    var corners:UIRectCorner
    var radius:CGFloat
    
    func path(in rect : CGRect)-> Path{
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

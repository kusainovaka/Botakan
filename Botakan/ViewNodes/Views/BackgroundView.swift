//
//  BagroundView.swift
//  mamakaz
//
//  Created by Kamila Kusainova on 10.12.17.
//  Copyright © 2017 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class BackgroundView: UIView {
    let imageCV: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "second_bg.png")
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupViewsBGR()
        LayoutsBGR()
    }
    func SetupViewsBGR() {
        [imageCV].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func LayoutsBGR(){
        imageCV <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
}

}

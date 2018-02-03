//
//  CLImage.swift
//  mamakaz
//
//  Created by Kamila Kusainova on 07.12.17.
//  Copyright © 2017 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class CLImage: UICollectionViewCell {
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        LayoutsCLI()
    }
    
 func LayoutsCLI(){
        imageView <- [
            Width(screenWidth / 2.88),
            Height(screenWidth / 2.88),
            Top(screenWidth / 15)
        ]
    }

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}



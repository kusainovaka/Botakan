//
//  MusicBtnMenu.swift
//  Botakan
//
//  Created by Kamila Kusainova on 24.01.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class MusicBtnMenu: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.frame = CGRect(x: 305, y: 30, width: 50, height: 50)
        self.layer.cornerRadius = screenWidth / 15
        self.layer.borderColor = UIColor.BlueColor.cgColor
        self.layer.borderWidth = 2
        self.backgroundColor = .sliderMusic
        self.setImage(UIImage(named:"sound_on.png"), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




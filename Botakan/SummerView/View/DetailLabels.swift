//
//  DetailLabels.swift
//  Botakan
//
//  Created by Kamila Kusainova on 29.01.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//
import UIKit
import EasyPeasy

class DetailLabels: UIView {
    
    let whiteBG: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "white_lenta.png")
        return imgV
    }()
    let nameLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 15.625)
        takpakLB.textColor = .BlueColor
        return takpakLB
    }()
    let triangle: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "viselki.png")
        return imgV
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsLabel()
        LayoutsLabel()
    }
    
    func setupViewsLabel() {
        [whiteBG,nameLabel,triangle].forEach{ addSubview($0) }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func LayoutsLabel(){
//        backTakpak <- [
//            Height(30),
//            Width(37),
//            Left(20),
//            Top(10)
//        ]
        whiteBG <- [
            Height(50),
            Width(257),
            Left(60),
            Top(90)
        ]
        nameLabel <- [
            Height(60),
            Width(250),
            Left(128.5),
            Top(77)
        ]
        triangle <- [
            Height(43),
            Width(255),
            Left(60),
            Top(0).to(whiteBG)
        ]
    }
}




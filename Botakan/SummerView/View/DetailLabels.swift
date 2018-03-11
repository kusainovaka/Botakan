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
    
    let bgCV: UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = .clear
        imgV.image = UIImage(named: "second_bg.png")
        return imgV
    }()
    let backBTN: UIButton = {
        let backBtn = UIButton()
        backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
        return backBtn
    }()
    let whiteBG: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "white_lenta.png")
        return imgV
    }()
    let nameLabel: UILabel = {
        let takpakLB = UILabel()
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 15.625)
        takpakLB.textAlignment = .center
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
        [bgCV,whiteBG,nameLabel,triangle,backBTN].forEach{ addSubview($0) }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func LayoutsLabel(){
        backBTN <- [
            Height(30),
            Width(37),
            Left(20),
            Top(40)
        ]
        bgCV <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        whiteBG <- [
            Height(screenWidth / 7.5),
            Width(screenWidth / 1.45),
            CenterX(0),
//            Left(60),
            Top(screenWidth / 4.16)
        ]
        nameLabel <- [
            Height(screenWidth / 6.25),
            Width(screenWidth / 1.5),
            CenterX(0),
//            Left(screenWidth / 3.57),
            Top(screenWidth / 4.8)
        ]
        triangle <- [
            Height(screenWidth / 8.72),
            Width(screenWidth / 1.47),
            CenterX(0),
//            Left(60),
            Top(0).to(whiteBG, .bottom)
        ]
    }
}




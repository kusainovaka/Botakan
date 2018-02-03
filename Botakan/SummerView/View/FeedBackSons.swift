//
//  FeedBackSons.swift
//  Botakan
//
//  Created by Kamila Kusainova on 29.01.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//
import UIKit
import EasyPeasy

class FeedBackSons: UIView {
   
    let ballons: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 65, y: 169, width: 12, height: 12))
        imgV.image = UIImage(named: "baloons.png")
        return imgV
    }()
    let longSon: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 43, y: 185, width: 12, height: 12))
        imgV.image = UIImage(named: "son_old.png")
        return imgV
    }()
    let orangeV: UIButton = {
        let btn = UIButton()
        return btn
    }()
    let twoSons: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "sons.png")
        return imgV
    }()
    let slLogo: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "copyright.png")
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        orangeV.backgroundColor = .orangeColor
        orangeV.layer.cornerRadius = 5
        orangeV.setTitle("Оценить приложение", for: .normal)
        orangeV.titleLabel?.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        orangeV.addTarget(self, action: #selector(rateApp), for: .touchUpInside)
        setupViewsLabel()
        setUpLayout()
    }
    func setupViewsLabel() {
        [ballons,longSon,orangeV,twoSons,slLogo].forEach{ addSubview($0) }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func rateApp(){
        let appDelegate = AppDelegate()
        appDelegate.requestReview()
    }
    func setUpLayout(){
        ballons <- [
            Height(100),
            Width(46),
            Left(50),
            Top(0)
        ]
        longSon <- [
            Height(120),
            Width(40),
            Left(54),
            Top(163)
        ]
        orangeV <- [
            Height(40),
            Width(155),
            Left(110),
            Top(145)
        ]
        twoSons <- [
            Height(100),
            Width(75),
            Right(10),
            Top(14)
        ]
        slLogo <- [
            Height(13),
            Width(28),
            Left(174),
            Top(320)
        ]
    }
}


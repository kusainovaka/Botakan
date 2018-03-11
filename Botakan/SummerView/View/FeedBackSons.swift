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
            Height(screenWidth / 3.75),
            Width(screenWidth / 8.15217),
            Left(screenWidth / 7.5),
            Top(0)
        ]
        longSon <- [
            Height(screenWidth / 3.125),
            Width(screenWidth / 9.375),
            Left(screenWidth / 6.94),
            Top(screenWidth / 2.15)
        ]
        orangeV <- [
            Height(screenWidth / 9.375),
            Width(screenWidth / 2.419),
            Left(screenWidth / 3.125),
            Top(screenWidth / 2.48),
        ]
        twoSons <- [
            Height(screenWidth / 3.75),
            Width(screenWidth / 5),
            Right(screenWidth / 37.5),
            Top(screenWidth / 25)
        ]
        slLogo <- [
            Height(screenWidth / 28.8461),
            Width(screenWidth / 13.39285),
            Left(screenWidth / 2.155),
            Top(screenWidth / 1.17)
        ]
    }
}


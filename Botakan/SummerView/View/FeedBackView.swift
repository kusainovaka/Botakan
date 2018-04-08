//
//  FeedBackView.swift
//  Botakan
//
//  Created by Kamila Kusainova on 26.01.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//
import UIKit
import EasyPeasy

class FeedBackView: UIView {
    let mamakLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 23.437)
        label.text = "Мама,"
        label.textColor = .BlueColor
        return label
    }()
    let kazLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 23.437)
        label.text = "қазақша сөйлеші!"
        
        label.textColor = .BlueColor
        return label
    }()
    let govorim: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        label.text = "Говорим с детьми на казахском"
        label.textColor = .BlueColor
        return label
    }()
    let asselSkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        label.numberOfLines = 3
        label.text = "       Сапакова Асель\n совместно с журналом\n       «Зерек Ботақан»"
        label.textColor = .BlueColor
        return label
    }()
    //    let orangeV: UIButton = {
    //        let btn = UIButton()
    //        return btn
    //    }()
    let instaAS: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        label.text = "@kaz_for_moms"
        label.textColor = .BlueColor
        return label
    }()
    let botakanWeb: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        label.text = "www.zerekbotaqan.com"
        label.textColor = .BlueColor
        return label
    }()
    let instaLogo: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "instagram.png")
        return imgV
    }()
    let webLogo: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "web.png")
        return imgV
    }()
    let littleSon: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "son_small.png")
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        //        orangeV.backgroundColor = .orangeColor
        //        orangeV.layer.cornerRadius = 5
        //        orangeV.setTitle("Оценить приложение", for: .normal)
        //        orangeV.titleLabel?.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        //        orangeV.addTarget(self, action: #selector(rateApp), for: .touchUpInside)
        setupViewsLabel()
        setUpLayout()
    }
    func setupViewsLabel() {
        [mamakLabel,kazLabel,govorim,asselSkLabel,instaAS,botakanWeb,instaLogo,webLogo,littleSon].forEach{ addSubview($0) }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func rateApp(){
        let appDelegate = AppDelegate()
        appDelegate.requestReview()
    }
    func setUpLayout(){
        mamakLabel <- [
            Height(screenWidth / 18.75),
            Width(screenWidth / 3.75),
            Left(screenWidth / 4.335),
            Top(screenWidth / 25)
        ]
        kazLabel <- [
            Height(screenWidth / 18.75),
            Width(screenWidth / 1.5306),
            Left(screenWidth / 9.375),
            Top(screenWidth / 10.714)
        ]
        govorim <- [
            Height(screenWidth / 25),
            Width(screenWidth / 1.1718),
            Left(screenWidth / 15),
            Top(screenWidth / 6.818)
        ]
        //        orangeV <- [
        //            Height(40),
        //            Width(155),
        //            Left(38),
        //            Top(75)
        //        ]
        asselSkLabel <- [
            Height(screenWidth / 4.6875),
            Width(screenWidth / 1.0869),
            Left(screenWidth / 8.52272),
            Top(screenWidth / 3.75)
        ]
        instaAS <- [
            Height(screenWidth / 18.75),
            Width(screenWidth / 3.5714),
            Left(screenWidth / 4.6875),
            Top(screenWidth / 2.2727)
        ]
        botakanWeb <- [
            Height(screenWidth / 18.75),
            Width(screenWidth / 2.3437),
            Left(screenWidth / 6.4655),
            Top(screenWidth / 2.08)
        ]
        littleSon <- [
            Height(screenWidth / 10.135),
            Width(screenWidth / 8.3333),
            Right(0),
            Top(screenWidth / 2.027)
        ]
        instaLogo  <- [
            Height(screenWidth / 31.25),
            Width(screenWidth / 31.25),
            Left(screenWidth / 5.7692),
            Top(screenWidth / 2.2189)
        ]
        webLogo  <- [
            Height(screenWidth / 31.25),
            Width(screenWidth / 31.25),
            Left(screenWidth / 8.72093),
            Top(screenWidth / 2.027)
        ]
    }
}

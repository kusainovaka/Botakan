////
////  CenterImageCell.swift
////  Botakan
////
////  Created by Kamila Kusainova on 03.02.18.
////  Copyright © 2018 kusainovaka. All rights reserved.
////
//
//
//import UIKit
//import EasyPeasy
//
//class CenterImageCell: UICollectionViewCell {
//
//    let imageView1: UIImageView = {
//        let imgView = UIImageView()
//        imgView.contentMode = .scaleAspectFill
//        imgView.clipsToBounds = true
//        return imgView
//    }()
////    let imageView2: UIImageView = {
////        let imgView = UIImageView()
////        imgView.contentMode = .scaleAspectFill
////        imgView.clipsToBounds = true
////        return imgView
////    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViewsLabel()
//        LayoutsCLI()
//    }
//    func setupViewsLabel() {
//        [imageView1].forEach{ addSubview($0) }
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func LayoutsCLI(){
//        imageView1 <- [
//            Height(screenWidth / 4.934),
//            Width(screenWidth / 4.934),
//            Left(screenWidth / 7.978),
//            Top(screenWidth / 16.304)
//        ]
////        image <- [
////            Height(110),
////            Width(110),
////            Left(50),
////            Top(6)
////        ]
////        imageView2 <- [
////            Height(76),
////            Width(76),
////            Left(10).to(image),
////            Top(23)
////        ]
//    }
//}
//
//
//
//

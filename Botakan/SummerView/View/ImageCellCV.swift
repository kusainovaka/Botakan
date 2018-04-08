////
////  ImageCellCV.swift
////  Botakan
////
////  Created by Kamila Kusainova on 31.01.18.
////  Copyright © 2018 kusainovaka. All rights reserved.
////
//
//import UIKit
//import EasyPeasy
//
//class ImageCellCV: UICollectionViewCell {
//
//        let image: UIImageView = {
//            let imgV = UIImageView()
//            imgV.layer.cornerRadius = 5
//            return imgV
//        }()
//        let imageView1: UIImageView = {
//            let imgView = UIImageView()
//            imgView.contentMode = .scaleAspectFill
//            imgView.clipsToBounds = true
//            return imgView
//        }()
//        let imageView2: UIImageView = {
//            let imgView = UIImageView()
//            imgView.contentMode = .scaleAspectFill
//            imgView.clipsToBounds = true
//            return imgView
//        }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViewsLabel()
//        LayoutsCLI()
//    }
//    func setupViewsLabel() {
//        [imageView1,imageView2].forEach{ addSubview($0) }
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func LayoutsCLI(){
//        imageView1 <- [
//            Height(76),
//            Width(76),
//            Left(47),
//            Top(23)
//        ]
////        image <- [
////            Height(110),
////            Width(110),
////            Left(10).to(imageView1),
////            Top(6)
////        ]
//        imageView2 <- [
//            Height(76),
//            Width(76),
//            Left(10).to(image),
//            Top(23)
//        ]
//    }
//}
//
//
//

//
//  MusicView.swift
//  Botakan
//
//  Created by Kamila Kusainova on 04.02.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class MusicView: UIView {
    
    let imageAnder: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: screenWidth / 34.1, y: 7, width: screenWidth / 5, height: screenWidth / 5))
        imgV.layer.cornerRadius = 5
        imgV.layer.borderWidth = 1
        imgV.layer.borderColor = UIColor.white.cgColor
        return imgV
    }()
    let leftMusic: UIButton = {
        let imgView = UIButton(frame: CGRect(x: screenWidth / 3.99, y: screenWidth / 17, width: screenWidth / 20.83, height: screenWidth / 20.83))
        imgView.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    let rightMusic: UIButton = {
        let imgView = UIButton(frame: CGRect(x: screenWidth / 2.358, y: screenWidth / 17, width: screenWidth / 20.83, height: screenWidth / 20.83))
        imgView.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    let btnMusic : UIButton = {
        let btn = UIButton(frame: CGRect(x: screenWidth / 3.15, y: screenWidth / 25, width: screenWidth / 11.72, height: screenWidth / 11.72))
        return btn
    }()
    let nameAn: UILabel = {
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.98, y: screenWidth / 25, width: screenWidth / 3.125, height: screenWidth / 25))
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        return takpakLB
    }()
    let nameArtist: UILabel = {
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.98, y: screenWidth / 12.09, width: screenWidth / 3.125, height: screenWidth / 25))
        takpakLB.textColor = UIColor.init(red: 26/255, green: 58/255, blue: 63/255, alpha: 0.7)
        takpakLB.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
        return takpakLB
    }()
    //slider
    var sliderMusic: UIProgressView = {
        let slider = UIProgressView()
        slider.frame = CGRect(x: screenWidth / 2.84, y: screenWidth / 6, width: screenWidth / 2.38, height: screenWidth / 12.5)
        slider.transform = CGAffineTransform(scaleX: 1, y: 3)

        slider.layer.cornerRadius = 5
        slider.layer.borderColor = UIColor.white.cgColor
        slider.layer.backgroundColor = UIColor.init(red: 213/255, green: 213/255, blue: 213/255, alpha: 1.0).cgColor
        slider.backgroundColor = .sliderMusic
        slider.tintColor = .sliderMusic
        return slider
    }()
    let durationMusic : UILabel = {
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 3.588, y: screenWidth / 6.55, width: screenWidth / 14.42, height: screenWidth / 31.25))
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 37.5)
        return takpakLB
    }()
    let allDurationMusic: UILabel = {
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.27, y: screenWidth / 6.55, width: screenWidth / 14.42, height: screenWidth / 31.25))
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 37.5)
        return takpakLB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsLabel()
        LayoutsLabel()
    }
    
    func setupViewsLabel() {
[imageAnder,leftMusic,rightMusic,btnMusic,nameAn,nameArtist,sliderMusic,durationMusic,allDurationMusic].forEach{ addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func LayoutsLabel(){
        
    }
}





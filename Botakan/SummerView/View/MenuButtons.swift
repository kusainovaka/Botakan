//
//  MenuButtons.swift
//  Botakan
//
//  Created by Kamila Kusainova on 29.01.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//
import UIKit
import EasyPeasy

class MenuButtons: UIView {

    let takpakBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "takpaktar"), for: .normal)
        return btn
    }()
    let anderBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "ander"), for: .normal)
        return btn
    }()
    let zhanyltBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "zhanyltpash"), for: .normal)
        return btn
    }()
    let sanamakBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "sanamak"), for: .normal)
        return btn
    }()
override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewsLabel()
    LayoutsLabel()
}

func setupViewsLabel() {
    [takpakBtn,anderBtn,zhanyltBtn,sanamakBtn].forEach{ addSubview($0) }
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
    
func LayoutsLabel(){
    takpakBtn <- [
        Height(screenWidth / 3.5714),
        Width(screenWidth / 1.55601),
        Left(screenWidth / 18.75),
        Top(screenWidth / 18.75),
        Bottom(40).to(anderBtn)
    ]
    anderBtn <- [
        Height(screenWidth / 3.75),
        Width(screenWidth / 2.2058),
        Right(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(takpakBtn),
        Bottom(screenWidth / 9.375).to(zhanyltBtn)
    ]
    zhanyltBtn <- [
        Height(screenWidth / 3.4403),
        Width(screenWidth / 1.1363),
        Left(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(anderBtn),
        Bottom(screenWidth / 9.375).to(sanamakBtn)
//        Height(109),
//        Width(330),
//        Left(40),
//        Top(screenWidth / 9.375).to(anderBtn),
//        Bottom(200)
    ]
    sanamakBtn <- [
        Height(screenWidth / 4.31034),
        Width(screenWidth / 1.4591),
        Right(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(zhanyltBtn),
        Bottom(screenWidth / 7.52)
    ]
}
}




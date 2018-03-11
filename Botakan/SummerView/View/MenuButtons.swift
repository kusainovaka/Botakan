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
        btn.setImage(#imageLiteral(resourceName: "Stakpaktar"), for: .normal)
        return btn
    }()
    let anderBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Sander"), for: .normal)
        return btn
    }()
    let zhanyltBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Szhanyltpash"), for: .normal)
        return btn
    }()
    let sanamakBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Ssanamak"), for: .normal)
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
        Bottom(40).to(anderBtn, .top)
    ]
    anderBtn <- [
        Height(screenWidth / 3.75),
        Width(screenWidth / 2.2058),
        Right(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(takpakBtn, .bottom),
        Bottom(screenWidth / 9.375).to(zhanyltBtn, .top)
    ]
    zhanyltBtn <- [
//        Height(109),
//        Width(330),
//        Left(20),
//        Top(40).to(anderBtn),
//        Bottom(40).to(sanamakBtn)
//        screenWidth / 4.1
        Height(screenWidth / 3.1),
        Width(screenWidth / 1.1363),
        Left(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(anderBtn, .bottom),
        Bottom(screenWidth / 9.375).to(sanamakBtn, .top)

    ]
    sanamakBtn <- [
        Height(screenWidth / 4.31034),
        Width(screenWidth / 1.4591),
        Right(screenWidth / 18.75),
        Top(screenWidth / 9.375).to(zhanyltBtn, .bottom),
        Bottom(screenWidth / 7.52)
    ]
}
}




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
        let btn = UIButton(frame: CGRect(x: 20, y: 352, width: 245, height: 105))
        btn.setImage(#imageLiteral(resourceName: "takpaktar"), for: .normal)
        return btn
    }()
    let anderBtn:UIButton = {
        let btn = UIButton(frame: CGRect(x: 185, y: 497, width: 170, height: 100))
        btn.setImage(#imageLiteral(resourceName: "ander"), for: .normal)
        return btn
    }()
    let zhanyltBtn:UIButton = {
        let btn = UIButton(frame: CGRect(x: 20, y: 637, width: 330, height: 109))
        btn.setImage(#imageLiteral(resourceName: "zhanyltpash"), for: .normal)
        return btn
    }()
    let sanamakBtn:UIButton = {
        let btn = UIButton(frame: CGRect(x: 98, y: 814, width: 257, height: 87))
        btn.setImage(#imageLiteral(resourceName: "sanamak"), for: .normal)
        return btn
    }()
override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewsLabel()
    anderBtn.addTarget(self, action: #selector(Temp1), for: .touchUpInside)
    LayoutsLabel()
}

func setupViewsLabel() {
    [takpakBtn,anderBtn,zhanyltBtn,sanamakBtn].forEach{ addSubview($0) }
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
    @objc func Temp1(){
        print("YESSS")
    }
    
func LayoutsLabel(){
    takpakBtn <- [
        Height(105),
        Width(241),
        Left(20),
        Top(20)
    ]
    anderBtn <- [
        Height(100),
        Width(170),
        Right(20),
        Top(40).to(takpakBtn)
    ]
    zhanyltBtn <- [
        Height(109),
        Width(330),
        Left(20),
        Top(40).to(anderBtn)
    ]
    sanamakBtn <- [
        Height(87),
        Width(257),
        Right(20),
        Top(40).to(zhanyltBtn)
    ]
}
}




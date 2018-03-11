//
//  SanamakDetailsVC.swift
//  Botakan
//
//  Created by Kamila Kusainova on 01.03.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class SanamakDetailsVC: UIViewController {

    var sanamakJS: ParsingJSON?
    var detailsBG: BackgroundView = {
        let field = BackgroundView()
        field.isUserInteractionEnabled = true
        return field
    }()
    var detailsViewSanamak: CollectionViewDetails = {
        let field = CollectionViewDetails()
        field.frame = CGRect(x: screenWidth / 15, y: screenWidth / 1.92, width: screenWidth / 1.153 , height: screenHeight / 1.66)
        field.imageCV.image =  UIImage(named: "sana.png")
        field.layer.masksToBounds = false
        field.layer.shadowOffset = CGSize(width: 3, height: 3)
        field.layer.shadowOpacity = 0.3
        field.layer.cornerRadius = 10
        field.layer.shadowRadius = 1
        field.layer.shadowColor = UIColor.black.cgColor
        field.backgroundColor = .white
        return field
    }()
    fileprivate lazy var nameSanamak: UILabel = {
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 5.97, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
        takpakLB.textColor = .BlueColor
        takpakLB.textAlignment = .center
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        return takpakLB
    }()
    fileprivate lazy var sanamak: UITextView = {
        let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.3))
        takpakLB.textAlignment = NSTextAlignment.justified
        takpakLB.showsVerticalScrollIndicator = false
        takpakLB.isScrollEnabled = true
        takpakLB.isEditable = false
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
        return takpakLB
    }()
    let tempBTN1: UIButton = {
        let backBtn = UIButton()
        return backBtn
    }()
    let tempBTN2: UIButton = {
        let backBtn = UIButton()
        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailsBG)
        view.addSubview(detailsViewSanamak)
        detailsViewSanamak.addSubview(nameSanamak)
        detailsViewSanamak.addSubview(sanamak)
        detailsBG.backBTN.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        //temp
        tempsB()
        nameSanamak.text = self.sanamakJS?.name
        sanamak.text = self.sanamakJS?.text
        setUpLayout()
    }
    
    func tempsB(){
        detailsBG.addSubview(tempBTN1)
        detailsBG.addSubview(tempBTN2)
        
        tempBTN1.setImage(UIImage(named:"1s.sng"),for:.normal)
        tempBTN2.setImage(UIImage(named:"2s.sng"),for:.normal)
//        tempBTN1.addTarget(self, action: #selector(temp1), for: .touchUpInside)
    }
    
    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
    }
    
//    @objc func temp1(){
//        print("TempBTN1")
//        tempBTN2.setImage(UIImage(named:"3s.sng"),for:.normal)
//    }
    
    func setUpLayout(){
        detailsBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        nameSanamak <- [
            CenterX(0),
            Top(screenWidth / 25),
            Width(screenWidth / 1.5),
            Height(screenWidth / 11.72)
        ]
        tempBTN1  <- [
            Top(96),
            Width(76),
            Left(63),
            Height(76)
        ]
        tempBTN2  <- [
            Top(96),
            Width(76),
            Right(63),
            Height(76)
        ]
       
    }
  

}

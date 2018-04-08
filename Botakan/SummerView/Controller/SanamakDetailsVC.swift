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

    var sanamakData: Int = 0
    
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
        let takpakLB = UITextView()
        takpakLB.textAlignment = NSTextAlignment.justified
        takpakLB.showsVerticalScrollIndicator = false
        takpakLB.isScrollEnabled = true
        takpakLB.isEditable = false
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
        return takpakLB
    }()
    fileprivate lazy var  imageSanamak: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
        imgV.layer.cornerRadius = 5
        return imgV
    }()
    fileprivate lazy var leftBTN: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    fileprivate lazy var rightBTN: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailsBG)
        view.addSubview(detailsViewSanamak)
        view.addSubview(leftBTN)
        view.addSubview(rightBTN)
        detailsViewSanamak.addSubview(nameSanamak)
        detailsViewSanamak.addSubview(sanamak)
        view.addSubview(imageSanamak)
        detailsBG.backBTN.addTarget(self, action: #selector(backToCV), for: .touchUpInside)

        setUpLayout()
        detailsData()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(backToCV))
        swipeRecognizer.direction = .right
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    
    func detailsData(){
        nameSanamak.text = sanamakParse[sanamakData].name
        sanamak.text = sanamakParse[sanamakData].text
        imageSanamak.image = UIImage(named: ("\(sanamakParse[sanamakData].photo)"))
        
        if sanamakData != 0 || sanamakData > 0{
            leftBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData - 1].photo)")), for: .normal)
        }
        leftBTN.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        if sanamakData == 0 || sanamakData < 13 {
            rightBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData + 1].photo)")), for: .normal)
        }
        rightBTN.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        
    }
    
    @objc func leftAction(){
        if sanamakData != 0 || sanamakData > 0 {
            sanamakData -= 1
            nameSanamak.text = sanamakParse[sanamakData].name
            sanamak.text = sanamakParse[sanamakData].text
            imageSanamak.image = UIImage(named: ("\(sanamakParse[sanamakData].photo).png"))
            if sanamakData == 0 {
                leftBTN.setImage(UIImage(named: ("")), for: .normal)
            }else {
                leftBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData - 1].photo)")), for: .normal)
            }
            rightBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData + 1].photo)")), for: .normal)
       }
        
    }
    @objc func rightAction(){
        if sanamakData == 0 || sanamakData < 8 {
            sanamakData += 1
            nameSanamak.text = sanamakParse[sanamakData].name
            sanamak.text = sanamakParse[sanamakData].text
           
            imageSanamak.image = UIImage(named: ("\(sanamakParse[sanamakData].photo).png"))
            leftBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData - 1].photo)")), for: .normal)
            rightBTN.setImage(UIImage(named: ("\(sanamakParse[sanamakData + 1].photo)")), for: .normal)
        }
    }
    
    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
    }

    
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
        leftBTN <- [
            Left(screenWidth / 7.9787),
            Top(screenWidth / 5.3571),
            Width(screenWidth / 4.6875),
            Height(screenWidth / 4.6875)
        ]
        rightBTN <- [
            Right(screenWidth / 7.9787),
            Top(screenWidth / 5.3571),
            Width(screenWidth / 4.6875),
            Height(screenWidth / 4.6875)
        ]
        sanamak <- [
            Left(screenWidth / 6),
            Top(screenWidth / 3.5),
            Width(screenWidth / 1.563),
            Height(screenWidth / 1.3),
            Bottom(5).to(detailsViewSanamak, .bottom)
        ]
    }
  

}

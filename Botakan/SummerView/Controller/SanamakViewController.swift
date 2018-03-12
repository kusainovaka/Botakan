//
//  SanamakViewController.swift
//  Botakan
//
//  Created by Kamila Kusainova on 04.02.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class SanamakViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    var sanamakParse = [ParsingJSON]()
    //    var vc = SanamakDetailsVC()
    fileprivate lazy var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "Санамақтар"
        return view
    }()
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.sanamakLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CLImage.self, forCellWithReuseIdentifier: "sanamakCell")
        return collectionView
    }()
    fileprivate lazy var sanamakLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: screenWidth / 2.89, height: screenWidth / 2.89)
        layout.minimumLineSpacing = screenWidth / 10.71
        layout.minimumInteritemSpacing = screenWidth / 10.71
        layout.sectionInset = UIEdgeInsets(top: screenWidth / 10.71, left: screenWidth / 9.375, bottom: screenWidth / 10.71, right: screenWidth / 9.375)
        return layout
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        getFromJSON()
        view.addSubview(detailLabel)
        view.addSubview(collectionView)
        layouyts()
        
        detailLabel.backBTN.addTarget(self, action: #selector(backToBTN), for: .touchUpInside)
    }
    
    @objc func backToBTN(){
        navigationController?.popViewController(animated: false)
        if Model.sharedInstance.sound == true{
            player.play()
        }
    }
    
    func getFromJSON(){
        do {
            if let path = Bundle.main.url(forResource: "Sanamak", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([ParsingJSON].self, from: url)
                self.sanamakParse = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sanamakParse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sanamakCell", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: sanamakParse[indexPath.row].photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        about(place: sanamakParse[indexPath.row])
        //        tempSMT(place: sanamakParse[indexPath.row - 1])
    }
    
    func about(place: ParsingJSON){
        let vc = SanamakDetailsVC()
        vc.sanamakJS = place
        //        print(place)
        //        vc.tempBTN1.addTarget(self, action: #selector(temp1), for: .touchUpInside)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func temp1(sender: UIButton){
        print("TempBTN1")
        //        vc.tempBTN2.setImage(UIImage(named:"3s.sng"),for:.normal)
        
    }
    func tempSMT(place: ParsingJSON){
        //        vc.tempBTN1.addTarget(self, action: #selector(temp1), for: .touchUpInside)
        //        vc.sanamakJS = place
        
        print(place)
    }
    
    
    func layouyts(){
        collectionView <- [
            Top(screenWidth / 2.3),
            Width(screenWidth),
            Left(0),
            Height(screenHeight / 1.08)
        ]
    }
    
}

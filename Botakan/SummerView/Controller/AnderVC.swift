//
//  AnderVC.swift
//  Botakan
//
//  Created by Kamila Kusainova on 01.02.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy
import AVFoundation

 var anderParse = [AnderJSON]()

class AnderVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    
   
    fileprivate lazy var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "Әндер"
        return view
    }()
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.sanamakLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CLImage.self, forCellWithReuseIdentifier: "anderCell")
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
        print(Model.sharedInstance.getName)
        detailLabel.backBTN.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
    }
    
    func getFromJSON(){
        do {
            if let path = Bundle.main.url(forResource: "AnderData", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([AnderJSON].self, from: url)
                anderParse = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func goToMenu(){
        navigationController?.popViewController(animated: false)
        
        if Model.sharedInstance.sound == true{
            player.play()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anderParse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "anderCell", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: anderParse[indexPath.row].photo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detail(data: indexPath.row)
    
    }
    
    func detail(data: Int){
        let vc = AnserDetailsViewController()
        vc.trackId = data
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func layouyts(){
        collectionView <- [
            Top(screenWidth / 2.1),
            Width(screenWidth),
            Left(0),
            Height(screenHeight / 1.08)
        ]
    } 
}

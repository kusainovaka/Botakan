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

class AnderVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    
    var anderParse = [AnderJSON]()

    fileprivate lazy var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "        Әндер"
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
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
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
                self.anderParse = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func goToMenu(){
        navigationController?.popViewController(animated: false)
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
//        about(place: anderParse[indexPath.row])
        let vc = AnserDetailsViewController()
        //        vc.anderParse = place
        navigationController?.pushViewController(vc, animated: false)
        let name = anderParse[indexPath.row].name
        let text = anderParse[indexPath.row].text
        let photo = anderParse[indexPath.row].photo
        let anderM = anderParse[indexPath.row].music
        let authorAN = anderParse[indexPath.row].author
        let anNameq = anderParse[indexPath.row].Anname
        
//        do{
//            let url = Bundle.main.url(forResource: "\(anderM)", withExtension: "mp3")
//            AudioPlayer = try AVAudioPlayer(contentsOf: url!)
//            AudioPlayer.prepareToPlay()
//        }catch let error as NSError{
//            print(error.debugDescription)
//        }
    
        vc.ander.text = text
        vc.nameAnder.text = name
        vc.musicVC.imageAnder.image = UIImage(named: photo)
        vc.musicVC.nameAn.text = anNameq
        vc.musicVC.nameArtist.text = authorAN
//        anderkDetail.anderDeatilView()
//        nameAnder.text = name
//        ander.text = text
//        imageAnder.image = UIImage(named: photo)
//        nameAn.text = anNameq
//        nameArtist.text = authorAN
        
    }
    
    func about(place: ParsingJSON){
        let vc = AnserDetailsViewController()
//        vc.anderParse = place
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func layouyts(){
        collectionView <- [
            Top(screenWidth / 2.3),
            Width(screenWidth),
            Left(10),
            Height(screenHeight / 1.08)
        ]
    } 
}

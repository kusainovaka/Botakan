//
//  anderNodes.swift
//  mamakaz
//
//  Created by Kamila Kusainova on 07.12.17.
//  Copyright © 2017 kusainovaka. All rights reserved.
//

import UIKit
import SpriteKit

extension AnderScene{
    func addBackground(){
        backgroundAnder = SKSpriteNode(color: .mainBlueColor, size: CGSize(width: screenWidth*2, height: screenWidth*4))
        backgroundAnder.zPosition = 0
        backgroundAnder.position = CGPoint(x: screenWidth, y: screenHeight)
        self.addChild(backgroundAnder)

        view?.addSubview(anderView)
    }
    
    func setupCollectionVIewAn(){
        CVAnder.frame = CGRect(x: 0, y: screenWidth / 2.3, width: screenWidth, height: screenHeight  / 1.08)
        CVAnder.register(CLImage.self, forCellWithReuseIdentifier: "anderCollection")
        CVAnder.dataSource = self
        CVAnder.delegate = self
        CVAnder.reloadData()
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
    
    @objc func backToAnderCBTN(){
        DispatchQueue.main.async {
        leftMusic.removeFromSuperview()
        rightMusic.removeFromSuperview()
        imageAnder.removeFromSuperview()
        musicView.removeFromSuperview()
        nameAnder.removeFromSuperview()
        nameAn.removeFromSuperview()
        nameArtist.removeFromSuperview()
        ander.removeFromSuperview()
        imageGirlandAn.removeFromSuperview()
        detailsViewAn.removeFromSuperview()
        backToMenuAnderVC.removeFromSuperview()
        }
        let scene = AnderScene(size: CGSize(width: screenWidth, height: screenHeight))
        scene.scaleMode = .aspectFill
        view?.presentScene(scene)
    }
    
}

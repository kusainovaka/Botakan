//
//  AnderVC.swift
//  Botakan
//
//  Created by Kamila Kusainova on 01.02.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy

class AnderVC: UIViewController {
    
    var anderParse = [AnderJSON]()

    
    var takpakBG: BackgroundView = {
        let field = BackgroundView ()
        field.isUserInteractionEnabled = true
        return field
    }()
    let backTakpak: UIButton = {
        let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
        backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
        return backBtn
    }()
    
    var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "    Әндер"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(takpakBG)
        view.addSubview(detailLabel)
        view.addSubview(backTakpak)
        layouyts()
        getFromJSON()
        backTakpak.addTarget(self, action: #selector(goToMenu), for: .touchUpInside)
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
    func layouyts(){
        takpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
    }
    
    
    
}

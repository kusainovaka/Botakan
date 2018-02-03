import Foundation
import SpriteKit
import EasyPeasy

extension GameScene{
    func takpakConfig(){
        nameKaz.isHidden = true
        nameMama.isHidden = true
        aselS.isHidden = true
        
        takpakView.backgroundColor = .mainBlueColor
        backButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
        takpakView.addSubview(backButton)
        setupCollectionVIew()
    }
  
    @objc func backToMenu(){
        sanamakN.isHidden = false
        takpakN.isHidden = false
        skorogovN.isHidden = false
        anderN.isHidden = false

        takpakView.removeFromSuperview()
        CVWW.removeFromSuperview()
        self.view?.isPaused = false
        labelName.removeFromSuperview()
        swipeU.isEnabled = true
        swipeD.isEnabled = true
    }
    
    func setupCollectionVIew(){
        CVWW.dataSource = self
        CVWW.delegate = self
        CVWW.collectionViewLayout.invalidateLayout()
        CVWW.register(CLImage.self, forCellWithReuseIdentifier: "collectionCell")
        CVWW.frame = CGRect(x: 0, y: screenWidth / 2.3, width: screenWidth, height: screenHeight / 1.08)
    }
   
}

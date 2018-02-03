import SpriteKit
import GameplayKit
import UIKit
import EasyPeasy

let swipeToCvSanamak = UISwipeGestureRecognizer()
var sanamakView: BackgroundView = {
    let field = BackgroundView ()
    field.isUserInteractionEnabled = true
    return field
}()
var backSanamak: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    backBtn.isUserInteractionEnabled = true
    return backBtn
}()
var CVaLabelSanam: LabelView = {
    let label = LabelView()
    label.takpakLabel.text = "   Санамақтар"
    label.takpakLabel.textColor = .BlueColor
    return label
}()
//collection
var CVSanamak: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor =  UIColor.red.withAlphaComponent(0)
    collectionView.register(CLImage.self, forCellWithReuseIdentifier: "sanamakCollection")
    return collectionView
}()
// detail
let detailsViewSana: CollectionViewDetails = {
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
let backSanamak2: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()
let imageSana: UIImageView = {
    let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
    imgV.layer.cornerRadius = 5
    return imgV
}()
let sanamak: UITextView = {
    let takpakLB = UITextView(frame: CGRect(x: screenWidth / 4.5, y: screenWidth / 1.2, width: screenWidth / 1.563, height: screenWidth / 1.39))
    takpakLB.textAlignment = NSTextAlignment.justified
    takpakLB.scrollsToTop = true
    takpakLB.isScrollEnabled = true
    takpakLB.showsVerticalScrollIndicator = false
    takpakLB.isEditable = false
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
    return takpakLB
}()
let nameSana: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 5.97, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
    return takpakLB
}()

class SanamakScene: SKScene {
    var sanamakJS = [ParsingJSON]()
    var backgroundNode:SKSpriteNode!
    override func didMove(to view: SKView) {
        pos = false
        self.addBackground()
        self.addCVdetaila()
        self.getFromJSON()
        
        for symbol: String in Thread.callStackSymbols {
            print(symbol)
        }
    }
    func addBackground(){
        backgroundNode = SKSpriteNode(color: .mainBlueColor, size: CGSize(width: screenWidth*2, height: screenWidth*4))
        backgroundNode.zPosition = 0
        backgroundNode.position = CGPoint(x: screenWidth, y: screenHeight)
        addChild(backgroundNode)
        view!.addSubview(sanamakView)
        view?.addSubview(backSanamak)
    }
    
    func addCVdetaila(){
        self.view?.addSubview(CVSanamak)
        CVSanamak.isHidden = false
        setupCollectionVIewSanam()
        CVsanaConfig()
    }
    
    func CVsanaConfig(){
        backSanamak.addTarget(self, action: #selector(some), for: .touchUpInside)
        self.view?.addSubview(CVaLabelSanam)
        
    }
    func setupCollectionVIewSanam(){
        CVSanamak.frame = CGRect(x: screenWidth / 37.5, y: screenWidth / 2.3, width: screenWidth, height: screenHeight / 1.08)
        CVSanamak.dataSource = self
        CVSanamak.delegate = self
        CVSanamak.register(CLImage.self, forCellWithReuseIdentifier: "sanamakCollection")
    }
    
    func getFromJSON(){
        do {
            if let path = Bundle.main.url(forResource: "Sanamak", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([ParsingJSON].self, from: url)
                self.sanamakJS = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func some(){
        let sceneG = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        sceneG.scaleMode = .aspectFill
        view?.presentScene(sceneG)
        CVSanamak.delegate = nil
        CVSanamak.dataSource = nil
        CVSanamak.removeFromSuperview()
        CVaLabelSanam.removeFromSuperview()
        backSanamak.removeFromSuperview()
        sanamakView.removeFromSuperview()
    }
    
    @objc func backBTNSanamak(){
        DispatchQueue.main.async {
            nameSana.removeFromSuperview()
            sanamak.removeFromSuperview()
            defaultImage.removeFromSuperview()
            imageSana.removeFromSuperview()
            imageGirland.removeFromSuperview()
            detailsViewSana.removeFromSuperview()
            backSanamak2.removeFromSuperview()
        }
        let scene = SanamakScene(size: CGSize(width: screenWidth, height: screenHeight))
        scene.scaleMode = .aspectFill
        view?.presentScene(scene)
    }
    
    func layouyts(){
        sanamakView <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
    }
}



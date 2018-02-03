import SpriteKit
import GameplayKit
import UIKit
import EasyPeasy

let swipeToCvZhanylt = UISwipeGestureRecognizer()
var zhanylView: BackgroundView = {
    let field = BackgroundView()
    return field
}()

//MainPart
var CVLabelzhanyl: LabelView = {
    let label = LabelView()
    label.takpakLabel.text = "Жаңылтпаштар"
    label.takpakLabel.textColor = .BlueColor
    return label
}()
var backZhanylt1: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()
//CollectionView
var CVZhanyl: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor =  UIColor.red.withAlphaComponent(0)
    collectionView.register(CLImage.self, forCellWithReuseIdentifier: "znaylCollection")
    return collectionView
}()
//Details
let detailsViewZh: CollectionViewDetails = {
    let field = CollectionViewDetails()
    field.frame = CGRect(x: screenWidth / 15, y: screenWidth / 1.9, width: screenWidth / 1.153 , height: screenHeight / 1.66)
    field.imageCV.image =  UIImage(named: "zhyldam.png")
    //    field.layer.masksToBounds = false
    field.layer.shadowOffset = CGSize(width: 3, height: 3)
    field.layer.shadowOpacity = 0.3
    field.layer.cornerRadius = 10
    field.layer.shadowRadius = 1
    field.layer.shadowColor = UIColor.black.cgColor
    field.backgroundColor = .white
    return field
}()
let backZhanylt2: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()
let imageZhanylt: UIImageView = {
    let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
    imgV.layer.cornerRadius = 5
    return imgV
}()
let zhanylt: UITextView = {
    let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3, width: screenWidth / 1.563, height: screenWidth / 1.5))
    takpakLB.textAlignment = NSTextAlignment.justified
    takpakLB.showsVerticalScrollIndicator = false
    takpakLB.isScrollEnabled = true
    takpakLB.isEditable = false
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
    return takpakLB
}()
let nameZhaylt: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 3.6, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
    return takpakLB
}()


class ZhanultpashScene: SKScene {
    var backgroundNode: SKSpriteNode!
    var zhanylJS = [ParsingJSON]()
    
    override func didMove(to view: SKView) {
        pos = false
        
        DispatchQueue.main.async {
            self.addBackground()
            self.addCVBTN()
            self.getFromJSON()
        }
        CVZhanyl.reloadData()
    }
    
    func addBackground(){
        backgroundNode = SKSpriteNode(color: .mainBlueColor, size: CGSize(width: screenWidth*2, height: screenWidth*4))
        backgroundNode.zPosition = 0
        backgroundNode.position = CGPoint(x: screenWidth, y: screenHeight)
        self.addChild(backgroundNode)
        
        view?.addSubview(zhanylView)
        view?.addSubview(backZhanylt1)
    }
    
    func addCVBTN(){
        self.view?.addSubview(CVZhanyl)
        setupCollectionVIewZh()
        backZhanylt1.addTarget(self, action: #selector(back1(_sender:)),for: .touchUpInside)
        self.view?.addSubview(CVLabelzhanyl)
    }
    
    func setupCollectionVIewZh(){
        CVZhanyl.frame = CGRect(x: screenWidth / 37.5, y: screenWidth / 2.3, width: screenWidth, height: screenHeight / 1.08)
        CVZhanyl.register(CLImage.self, forCellWithReuseIdentifier: "znaylCollection")
        CVZhanyl.dataSource = self
        CVZhanyl.delegate = self
        CVZhanyl.reloadData()
    }
    
    func getFromJSON(){
        do {
            if let path = Bundle.main.url(forResource: "ZhanylData", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([ParsingJSON].self, from: url)
                self.zhanylJS = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func back1(_sender: UIButton){
        let sceneG = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        sceneG.scaleMode = .aspectFill
        view?.presentScene(sceneG)
        //        CVZhanyl.delegate = nil
        //        CVZhanyl.dataSource = nil
        CVLabelzhanyl.removeFromSuperview()
        CVZhanyl.removeFromSuperview()
        backZhanylt1.removeFromSuperview()
        zhanylView.removeFromSuperview()
    }
    
    @objc func two(){
        DispatchQueue.main.async {
            nameZhaylt.removeFromSuperview()
            zhanylt.removeFromSuperview()
            defaultImage.removeFromSuperview()
            imageZhanylt.removeFromSuperview()
            imageGirland.removeFromSuperview()
            detailsViewZh.removeFromSuperview()
            backZhanylt2.removeFromSuperview()
        }
        let scene = ZhanultpashScene(size: CGSize(width: screenWidth, height: screenHeight))
        scene.scaleMode = .aspectFill
        view?.presentScene(scene)
    }
    
    func layouyts(){
        zhanylView <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
    }
}


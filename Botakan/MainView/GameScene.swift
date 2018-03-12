import SpriteKit
import GameplayKit
import UIKit
import EasyPeasy
import AVFoundation

var grassNode: SKSpriteNode!
var wRect: SKSpriteNode!
var location = CGPoint.zero
let swipeD = UISwipeGestureRecognizer()
let swipeU = UISwipeGestureRecognizer()
var nameMama:SKLabelNode!
var nameKaz:SKLabelNode!
var aselS:SKLabelNode!
var musicButton: SKSpriteNode!
var musicON: SKTexture!
var musicOFF: SKTexture!
var shineEmitter:SKEmitterNode!
var pos = true
var takpakN:SKSpriteNode!
var anderN:SKSpriteNode!
var skorogovN:SKSpriteNode!
var sanamakN:SKSpriteNode!
let swipeToCvTakpak = UISwipeGestureRecognizer()
var backgroundMusic = SKAudioNode()

//var player = AVAudioPlayer()
var toggleState = 1

// MARK: - takpakView
var takpakView: BackgroundView = {
    let field = BackgroundView()
    return field
}()

var labelName:LabelView = {
    let label = LabelView()
    label.takpakLabel.text = "     Тақпақтар"
    label.takpakLabel.textColor = .BlueColor
    return label
}()

let backButton: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()

let backToCVBtn: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()

//Detal
var detailsView: CollectionViewDetails = {
    let field = CollectionViewDetails()
    field.frame = CGRect(x: screenWidth / 15, y: screenWidth / 1.92, width: screenWidth / 1.153 , height: screenHeight / 1.66)
    field.imageCV.image =  UIImage(named: "oky.png")
    field.layer.shadowColor = UIColor.black.cgColor
    field.layer.masksToBounds = false
    field.layer.shadowOffset = CGSize(width: 3, height: 3)
    field.layer.shadowOpacity = 0.3
    field.layer.cornerRadius = 10
    field.layer.shadowRadius = 1
    field.backgroundColor = .white
    return field
}()
var imageFromCv: UIImageView = {
    let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
    imgV.layer.cornerRadius = 5
    return imgV
}()
let takpak: UITextView = {
    let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.3))
    takpakLB.textAlignment = NSTextAlignment.justified
    takpakLB.showsVerticalScrollIndicator = false
    takpakLB.isScrollEnabled = true
    takpakLB.isEditable = false
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
    return takpakLB
}()
let nameTakpak: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 5.97, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
    return takpakLB
}()
let imageGirland: UIImageView = {
    let imgView = UIImageView(frame: CGRect(x: 0, y: screenWidth / 2.55, width: screenWidth, height: screenWidth / 6.25))
    imgView.image = UIImage(named: "all_girland")
    return imgView
}()
let defaultImage : DefaultBGImage = {
    let defImg = DefaultBGImage()
    defImg.imageView1.image = UIImage(named: "default")
    defImg.imageView2.image = UIImage(named: "default")
    return defImg
}()

var CVWW: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor =  UIColor.red.withAlphaComponent(0)
    collectionView.register(CLImage.self, forCellWithReuseIdentifier: "collectionCell")
    return collectionView
}()

var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: screenWidth / 2.5, height: screenWidth / 2.5)
    //    layout.minimumLineSpacing = 25
    //    layout.minimumInteritemSpacing = 25
    layout.sectionInset = UIEdgeInsets(top: 0, left: screenWidth / 15, bottom: 0, right: screenWidth / 15)
    return layout
}()

let waitingView: ProgressBar = {
    let temp = ProgressBar(frame: CGRect(x: screenWidth / 4.6875, y: screenWidth / 1.93, width: screenWidth / 1.736, height: screenWidth / 1.5))
    temp.layer.shadowColor = UIColor.black.cgColor
    temp.layer.masksToBounds = false
    temp.layer.shadowOffset = CGSize(width: 3, height: 3)
    temp.layer.shadowOpacity = 0.3
    temp.layer.shadowRadius = 1
    return temp
}()

class GameScene: SKScene,SKPhysicsContactDelegate{
    var tempParse = [ParsingJSON]()
    var backgroundNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        scene?.backgroundColor = .white
        self.addBackground()
        self.addCloud()
        self.labe1()
        self.cloudsName()
        self.connect()
        self.soundButton()
        self.contactLabel()
        self.shineAdd()
        self.getFromJSON()
        swipeU.isEnabled = true
        swipeD.isEnabled = true
        
        nameKaz.isHidden = false
        nameMama.isHidden = false
        aselS.isHidden = false
        if pos == true{
            let wait = SKAction.wait(forDuration:1)
            let actionMoveDown = SKAction.run {
                let move = SKAction.moveBy(x: 0, y: screenWidth / 1.2, duration: 2)
                self.backgroundNode.run(move)
            }
            run(SKAction.sequence([wait,actionMoveDown]))
        }else{
            backgroundNode.position = CGPoint(x: screenWidth/2, y: screenWidth / 1.2)
        }
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hiddenAction), userInfo: nil, repeats: true)
        
        backgroundMusic = SKAudioNode(fileNamed: "other-music-loops-08610001")
        addChild(backgroundMusic)
        if Model.sharedInstance.sound == true{
            backgroundMusic.run(SKAction.play())
        }else {
            backgroundMusic.run(SKAction.stop())
        }
    }
    
    func getFromJSON(){
        do {
            if let path = Bundle.main.url(forResource: "AllData", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([ParsingJSON].self, from: url)
                self.tempParse = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    @objc func hiddenAction(){
        let hiddenName = SKAction.wait(forDuration:5)
        let actionHidden = SKAction.run {
            nameKaz.isHidden = true
            nameMama.isHidden = true
            aselS.isHidden = true
        }
        run(SKAction.sequence([hiddenName,actionHidden]))
        
    }
    override func update(_ currentTime: TimeInterval) {
        swipeD.addTarget(self, action: #selector(GameScene.swipedDown))
        swipeU.addTarget(self, action: #selector(GameScene.swipedUp))
        if Model.sharedInstance.sound == true{
            backgroundMusic.run(SKAction.play())
        }else if Model.sharedInstance.sound == false{
            backgroundMusic.run(SKAction.stop())
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = self.atPoint(location)
        if node.name == "takpak" {
            cvOpen()
            sanamakN.isHidden = true
            takpakN.isHidden = true
            skorogovN.isHidden = true
            anderN.isHidden = true
        } else if node.name == "ander" {
            view?.addSubview(waitingView)
            Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timer1), userInfo: nil, repeats: true)
            waitingView.progress.setProgress(0, animated: false)
        }else if node.name == "skorogovor" {
            view?.addSubview(waitingView)
            Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timer2), userInfo: nil, repeats: true)
            waitingView.progress.setProgress(0, animated: false)
        }else if node.name == "sanamak" {
            view?.addSubview(waitingView)
            Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timer3), userInfo: nil, repeats: true)
            waitingView.progress.setProgress(0, animated: false)
        }
            
        else if node.name == "musicButton" {
            if Model.sharedInstance.sound == true{
                musicButton.texture = musicOFF
                backgroundMusic.run(SKAction.play())
                Model.sharedInstance.sound = false
            }else if Model.sharedInstance.sound == false{
                musicButton.texture = musicON
                backgroundMusic.run(SKAction.pause())
                Model.sharedInstance.sound = true
            }   }
            
        else if node.name == "Rate"{
            let appDelegate = AppDelegate()
            appDelegate.requestReview()
        }
    }
    
    @objc func timer1(){
        if waitingView.progress.progress  != 1{
            waitingView.progress.progress += 2 / 10
        } else {
            waitingView.removeFromSuperview()
            self.view?.isPaused = true
            let scene = AnderScene(size: CGSize(width: screenWidth, height: screenHeight))
            scene.scaleMode = .aspectFill
            view?.presentScene(scene)
        }
    }
    @objc func timer2(){
        if waitingView.progress.progress  != 1{
            waitingView.progress.progress += 2 / 10
        } else {
            waitingView.removeFromSuperview()
            self.view?.isPaused = true
            let scene = ZhanultpashScene(size: CGSize(width: screenWidth, height: screenHeight))
            scene.scaleMode = .aspectFill
            view?.presentScene(scene)
        }
    }
    @objc func timer3(){
        if waitingView.progress.progress  != 1{
            waitingView.progress.progress += 2 / 10
        } else {
            waitingView.removeFromSuperview()
            self.view?.isPaused = true
            let scene = SanamakScene(size: CGSize(width: screenWidth, height: screenHeight))
            scene.scaleMode = .aspectFill
            view?.presentScene(scene)
        }
    }
    func cvOpen(){
        self.view?.isPaused = true
        self.setupCollectionVIew()
        self.view?.addSubview(takpakView)
        
        view?.addSubview(CVWW)
        self.view?.addSubview(labelName)
        self.layouts()
        self.takpakConfig()
        swipeU.isEnabled = false
        swipeD.isEnabled = false
        takpakConfig()
    }
    
    @objc func backToCV(){
        defaultImage.removeFromSuperview()
        imageGirland.removeFromSuperview()
        imageFromCv.removeFromSuperview()
        takpak.removeFromSuperview()
        nameTakpak.removeFromSuperview()
        detailsView.removeFromSuperview()
        backToCVBtn.removeFromSuperview()
        view?.addSubview(labelName)
        view?.addSubview(CVWW)
        takpakConfig()
    }
    
    func layouts(){
        takpakView <- [
            Right(0),
            Left(0),
            Top(0),
            Bottom(0)
        ]
    }
}



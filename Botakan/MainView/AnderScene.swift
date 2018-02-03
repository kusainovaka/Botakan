
import SpriteKit
import GameplayKit
import UIKit
import EasyPeasy
import AVFoundation

let swipeToCvAnder = UISwipeGestureRecognizer()
var anderView: BackgroundView = {
    let field = BackgroundView()
    return field
}()

var CVaLabelnder: LabelView = {
    let label = LabelView()
    label.takpakLabel.text = "        Әндер"
    label.takpakLabel.textColor = .BlueColor
    return label
}()
//Collection
var CVAnder: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor =  UIColor.red.withAlphaComponent(0)
    collectionView.register(CLImage.self, forCellWithReuseIdentifier: "anderCollection")
    return collectionView
}()
//DEtails into ander
var detailsViewAn: CollectionViewDetails = {
    let field = CollectionViewDetails()
    field.frame = CGRect(x: screenWidth / 15, y: screenWidth / 1.92, width: screenWidth / 1.153 , height: screenHeight / 1.66)
    field.imageCV.image =  UIImage(named: "an.png")
    field.layer.masksToBounds = false
    field.layer.shadowOffset = CGSize(width: 3, height: 3)
    field.layer.shadowOpacity = 0.3
    field.layer.cornerRadius = 10
    field.layer.shadowRadius = 1
    field.layer.shadowColor = UIColor.black.cgColor
    field.backgroundColor = .white
    return field
}()

let ander: UITextView = {
    let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.39))
    takpakLB.textAlignment = NSTextAlignment.justified
    takpakLB.showsVerticalScrollIndicator = false
    takpakLB.isScrollEnabled = true
    takpakLB.isEditable = false
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
    return takpakLB
}()

let nameAnder: UILabel = {
    let takpakLB = UILabel(frame:CGRect(x: screenWidth / 5.97, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
    return takpakLB
}()
var backToMenuAnderVC: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()
var backToMenuBTN: UIButton = {
    let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
    backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
    return backBtn
}()
//musicsView
let musicView: UIView = {
    let musicv = UIView(frame: CGRect(x: screenWidth / 15, y: screenWidth / 4.46, width: screenWidth / 1.153, height: screenWidth / 4.167))
    musicv.backgroundColor = .bgMusic
    musicv.layer.masksToBounds = false
    musicv.layer.shadowOffset = CGSize(width: 3, height: 3)
    musicv.layer.shadowOpacity = 0.3
    musicv.layer.shadowRadius = 1
    musicv.layer.borderWidth = 2
    musicv.layer.borderColor = UIColor.white.cgColor
    musicv.layer.cornerRadius = 5
    return musicv
}()
let imageAnder: UIImageView = {
    let imgV = UIImageView(frame: CGRect(x: screenWidth / 34.1, y: 7, width: screenWidth / 5, height: screenWidth / 5))
    imgV.layer.cornerRadius = 5
    imgV.layer.borderWidth = 1
    imgV.layer.borderColor = UIColor.white.cgColor
    return imgV
}()
let leftMusic: UIButton = {
    let imgView = UIButton(frame: CGRect(x: screenWidth / 3.99, y: screenWidth / 17, width: screenWidth / 20.83, height: screenWidth / 20.83))
    imgView.setImage(#imageLiteral(resourceName: "back"), for: .normal)
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    return imgView
}()
let rightMusic: UIButton = {
    let imgView = UIButton(frame: CGRect(x: screenWidth / 2.358, y: screenWidth / 17, width: screenWidth / 20.83, height: screenWidth / 20.83))
    imgView.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    return imgView
}()
let btnMusic : UIButton = {
    let btn = UIButton(frame: CGRect(x: screenWidth / 3.15, y: screenWidth / 25, width: screenWidth / 11.72, height: screenWidth / 11.72))
    return btn
}()
let nameAn: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.98, y: screenWidth / 25, width: screenWidth / 3.125, height: screenWidth / 25))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
    return takpakLB
}()
let nameArtist: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.98, y: screenWidth / 12.09, width: screenWidth / 3.125, height: screenWidth / 25))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "HelveticaNeue", size: screenWidth / 31.25)
    return takpakLB
}()
//slider
var sliderMusic:UISlider = {
    let slider = UISlider(frame: CGRect(x: screenWidth / 2.757, y: screenWidth / 6.578, width: screenWidth / 2.38, height: screenWidth / 46.875))
    slider.isContinuous = true
    slider.layer.cornerRadius = 5
    slider.layer.borderWidth = 1
    slider.layer.borderColor = UIColor.white.cgColor
    slider.layer.backgroundColor = UIColor.init(red: 213/255, green: 213/255, blue: 213/255, alpha: 1.0).cgColor
    slider.backgroundColor = .sliderMusic
    slider.tintColor = .sliderMusic
    slider.setThumbImage(UIImage(named: "Oval2")!, for: .normal)
    return slider
}()
let durationMusic : UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 3.588, y: screenWidth / 6.94, width: screenWidth / 14.42, height: screenWidth / 31.25))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 37.5)
    return takpakLB
}()
let allDurationMusic: UILabel = {
    let takpakLB = UILabel(frame: CGRect(x: screenWidth / 1.256, y: screenWidth / 6.94, width: screenWidth / 14.42, height: screenWidth / 31.25))
    takpakLB.textColor = .BlueColor
    takpakLB.font = UIFont(name: "HelveticaNeue-Medium", size: screenWidth / 37.5)
    return takpakLB
}()
let imageGirlandAn: UIImageView = {
    let imgView = UIImageView(frame: CGRect(x: 0, y: screenWidth / 2.58, width: screenWidth, height: screenWidth / 6.25))
    imgView.image = UIImage(named: "all_girland")
    return imgView
}()
var allDurM = Float()
var nowDurM = Float()
var a = String()
var b = String()
var time = TimeInterval()

var AudioPlayer = AVAudioPlayer()

class AnderScene: SKScene {
    var anderParse = [AnderJSON]()
    var backgroundAnder:SKSpriteNode!
    var musicState = 1
    
    override func didMove(to view: SKView) {
        pos = false
        configCV()
        self.getFromJSON()
        self.LayoutsAn()
        self.musicConfig()
        
        do{
            let url = Bundle.main.url(forResource: "", withExtension: "mp3")
            AudioPlayer = try AVAudioPlayer(contentsOf: url!)
            AudioPlayer.prepareToPlay()
        }catch let error as NSError{
            print(error.debugDescription)
        }
        ///music
        sliderMusic.maximumValue = Float(AudioPlayer.duration)
        sliderMusic.addTarget(self, action: #selector(scrollMusic), for: .valueChanged)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let currT = AudioPlayer.duration
        time = AudioPlayer.currentTime
        nowDurM = Float(currT / 60)
        allDurM = Float(time / 60)
        a = (String(format: "%.2f", nowDurM))
        b = (String(format: "%.2f", allDurM))
        durationMusic.text = b
        allDurationMusic.text = a
    }
    
    func configCV(){
        addBackground()
        self.view?.addSubview(CVAnder)
        CVanderConfig()
    }
    
    func CVanderConfig(){
        anderView.addSubview(backToMenuBTN)
        setupCollectionVIewAn()
        self.view?.addSubview(CVaLabelnder)
        backToMenuBTN.addTarget(self, action: #selector(backToMenuAn), for: .touchUpInside)
    }
    
    @objc func backToMenuAn(){
        let sceneG = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        sceneG.scaleMode = .aspectFill
        view?.presentScene(sceneG)
        //        CVAnder.delegate = nil
        //        CVAnder.dataSource = nil
        CVaLabelnder.removeFromSuperview()
        CVAnder.removeFromSuperview()
        anderView.removeFromSuperview()
    }
    
    func musicConfig(){
        btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
        btnMusic.addTarget(self, action: #selector(pressMussic), for: .touchDown)
        leftMusic.addTarget(self, action: #selector(leftBTN), for: .touchUpInside)
        rightMusic.addTarget(self, action: #selector(rightBTN), for: .touchUpInside)
    }
    
    @objc func pressMussic(){
        if musicState == 1 {
            btnMusic.setImage(UIImage(named:"pause.png"),for:.normal)
            AudioPlayer.play()
            musicState = 2
        } else {
            btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
            AudioPlayer.pause()
            musicState = 1
        }
    }
    @objc func scrollMusic(){
        AudioPlayer.stop()
        AudioPlayer.currentTime = TimeInterval(sliderMusic.value)
        AudioPlayer.prepareToPlay()
        musicState = 1
        AudioPlayer.play()
    }
    
    @objc func updateSlider(){
        sliderMusic.value = Float(AudioPlayer.currentTime)
    }
    @objc func leftBTN(){
        time = AudioPlayer.currentTime
        time -= 0.50
        if time > AudioPlayer.duration
        {
            AudioPlayer.stop()
        }else
        {
            AudioPlayer.currentTime = time
        }
    }
    
    @objc func rightBTN(){
        var time: TimeInterval = AudioPlayer.currentTime
        time += 0.50
        if time > AudioPlayer.duration
        {
            AudioPlayer.stop()
        }else
        {
            AudioPlayer.currentTime = time
        }
    }
    
    func LayoutsAn(){
        anderView <- [
            Right(0),
            Left(0),
            Top(0),
            Bottom(0)
        ]
    }
}



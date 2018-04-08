//
//  AnserDetailsViewController.swift
//  Botakan
//
//  Created by Kamila Kusainova on 04.02.18.
//  Copyright © 2018 kusainovaka. All rights reserved.
//

import UIKit
import EasyPeasy
import AVFoundation


class AnserDetailsViewController: UIViewController {

    var trackId: Int = 0
    var musicState = 1

    var detailsTakpakBG: BackgroundView = {
        let field = BackgroundView()
        field.isUserInteractionEnabled = true
        return field
    }()
    let detailsViewAnder: CollectionViewDetails = {
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
    public lazy var musicVC: MusicView = {
        let music = MusicView()
        music.backgroundColor = .bgMusic
        music.layer.masksToBounds = false
        music.layer.shadowOffset = CGSize(width: 3, height: 3)
        music.layer.shadowOpacity = 0.3
        music.layer.shadowRadius = 1
        music.layer.borderWidth = 2
        music.layer.borderColor = UIColor.white.cgColor
        music.layer.cornerRadius = 5
        return music
    }()
    public lazy var nameAnder: UILabel = {
        let takpakLB = UILabel()
        takpakLB.textColor = .BlueColor
        takpakLB.textAlignment = .center
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        return takpakLB
    }()
    public lazy var ander: UITextView = {
        let takpakLB = UITextView()
        takpakLB.textAlignment = NSTextAlignment.justified
        takpakLB.showsVerticalScrollIndicator = false
        takpakLB.isScrollEnabled = true
        takpakLB.isEditable = false
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
        return takpakLB
    }()
//smt
    var audioPlayer = AVAudioPlayer()
    var allDurM = Float()
    var nowDurM = Float()
    var a = String()
    var b = String()
  
    var time = TimeInterval()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailsTakpakBG)
        view.addSubview(detailsViewAnder)
        view.addSubview(musicVC)
        detailsViewAnder.addSubview(nameAnder)
        detailsViewAnder.addSubview(ander)        
        detailsTakpakBG.backBTN.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        setUpLayout()
        musicConfig()
        ander.text = anderParse[trackId].text
        nameAnder.text = anderParse[trackId].name
        musicVC.imageAnder.image = UIImage(named: ("\(anderParse[trackId].photo)"))
        musicVC.nameAn.text = anderParse[trackId].Anname
        musicVC.nameArtist.text = anderParse[trackId].author
       
        
        do{
            let url = Bundle.main.url(forResource: "\(String(describing: anderParse[trackId].music))", withExtension: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
            musicVC.sliderMusic.setProgress(Float(audioPlayer.currentTime / audioPlayer.duration), animated: false)

        }catch let error as NSError {
            print(error.localizedDescription)
        }
   
        
        let allT = audioPlayer.duration
        
        
//        let seconds = 131.531   // 131.531
        let time = allT.minuteSecondMS  //  "2:11.531"
//        let millisecond = allT.millisecond    // 531
        
        
        b = (String(time))
        musicVC.allDurationMusic.text = b
        musicVC.durationMusic.text = "0.00"
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(backToCV))
        swipeRecognizer.direction = .right
        view.addGestureRecognizer(swipeRecognizer)
    }
   
    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
        audioPlayer.stop()
    }
    
    @objc func updateProgress(){
        
        if audioPlayer.isPlaying == true{
            musicVC.sliderMusic.setProgress(Float(audioPlayer.currentTime / audioPlayer.duration), animated: true)
                    time = audioPlayer.currentTime
                    allDurM = Float(time / 60)
                    b = (String(format: "%.2f", allDurM))
                    musicVC.durationMusic.text = b
        }
    }
    
    func musicConfig(){
        musicVC.btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
        musicVC.btnMusic.addTarget(self, action: #selector(pressMussic), for: .touchDown)
        musicVC.leftMusic.addTarget(self, action: #selector(leftBTN), for: .touchUpInside)
        musicVC.rightMusic.addTarget(self, action: #selector(rightBTN), for: .touchUpInside)
    }
    
    @objc func pressMussic(){
        if musicState == 1 {
            musicVC.btnMusic.setImage(UIImage(named:"pause.png"),for:.normal)
            audioPlayer.play()
            musicState = 2
        } else {
            musicVC.btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
            audioPlayer.pause()
            musicState = 1
        }
    }
    @objc func leftBTN(){
        if trackId != 0 || trackId > 0 {
            trackId -= 1
            nameAnder.text = anderParse[trackId].name
            ander.text = anderParse[trackId].text
            musicVC.imageAnder.image = UIImage(named: ("\(anderParse[trackId].photo)"))
            musicVC.nameAn.text = anderParse[trackId].Anname
            musicVC.nameArtist.text = anderParse[trackId].author
           musicVC.durationMusic.text = "0.00"
            do{
                let url = Bundle.main.url(forResource: "\(String(describing: anderParse[trackId].music))", withExtension: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayer.prepareToPlay()
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
                musicVC.sliderMusic.setProgress(Float(audioPlayer.currentTime / audioPlayer.duration), animated: false)
                
            }catch let error as NSError {
                print(error.localizedDescription)
            }
            musicVC.btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
        }
        
    }
    @objc func rightBTN(){
        if trackId == 0 || trackId < 20 {
            trackId += 1
            nameAnder.text = anderParse[trackId].name
            ander.text = anderParse[trackId].text
            musicVC.imageAnder.image = UIImage(named: ("\(anderParse[trackId].photo)"))
            musicVC.nameAn.text = anderParse[trackId].Anname
            musicVC.nameArtist.text = anderParse[trackId].author
            musicVC.durationMusic.text = "0.00"
           
            do{
                let url = Bundle.main.url(forResource: "\(String(describing: anderParse[trackId].music))", withExtension: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayer.prepareToPlay()
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
                musicVC.sliderMusic.setProgress(Float(audioPlayer.currentTime / audioPlayer.duration), animated: false)
                
            }catch let error as NSError {
                print(error.localizedDescription)
            }
           musicVC.btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
        }
    }
//    @objc func scrollMusic(){
//        AudioPlayer.stop()
//        AudioPlayer.currentTime = TimeInterval(sliderMusic.value)
//        AudioPlayer.prepareToPlay()
//        musicState = 1
//        AudioPlayer.play()
//    }
    
    func setUpLayout(){
        detailsTakpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        musicVC <- [
            Top(screenWidth / 3.75),
            Width(screenWidth / 1.1538),
            Left(screenWidth / 15),
            Height(screenWidth / 4.166)
        ]
        nameAnder <- [
            CenterX(0),
            Top(screenWidth / 25),
            Width(screenWidth / 1.5),
            Height(screenWidth / 11.72)
        ]
//        frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.3)
        ander <- [
            Left(screenWidth / 6),
            Top(screenWidth / 3.5),
            Width(screenWidth / 1.563),
            Height(screenWidth / 1.3),
            Bottom(5).to(detailsViewAnder, .bottom)
        ]
    }
}


extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second, millisecond)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}

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

    var anderParse: ParsingJSON?
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
        let takpakLB = UILabel(frame: CGRect(x: screenWidth / 5.97, y: screenWidth / 25, width: screenWidth / 1.5, height: screenWidth / 11.72))
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        return takpakLB
    }()
    public lazy var ander: UITextView = {
        let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.3))
        takpakLB.textAlignment = NSTextAlignment.justified
        takpakLB.showsVerticalScrollIndicator = false
        takpakLB.isScrollEnabled = true
        takpakLB.isEditable = false
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
        return takpakLB
    }()

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
        do{
            let url = Bundle.main.url(forResource: "", withExtension: "mp3")
            AudioPlayer = try AVAudioPlayer(contentsOf: url!)
            AudioPlayer.prepareToPlay()
        }catch let error as NSError{
            print(error.debugDescription)
        }
        //misocSlider
        musicVC.sliderMusic.maximumValue = Float(AudioPlayer.duration)
        musicVC.sliderMusic.addTarget(self, action: #selector(scrollMusic), for: .valueChanged)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
   

    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
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
//            AudioPlayer.play()
            musicState = 2
        } else {
            musicVC.btnMusic.setImage(UIImage(named:"play.png"),for:.normal)
//            AudioPlayer.pause()
            musicState = 1
        }
    }
    @objc func leftBTN(){
        
    }
    @objc func rightBTN(){
        
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
    func setUpLayout(){
        detailsTakpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        musicVC <- [
            Top(100),
            Width(325),
            Left(25),
            Height(90)
        ]
    }
}

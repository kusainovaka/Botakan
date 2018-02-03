import UIKit
import SpriteKit
extension GameScene {
    func addBackground(){
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        backgroundNode = SKSpriteNode(texture: SKTexture(imageNamed: "main_bg.png"))
        backgroundNode.position = CGPoint(x: screenWidth/2  , y: 0)
        backgroundNode.size = CGSize(width: screenWidth, height: screenHeight*2.1)
        backgroundNode.zPosition = 0
        swipeD.direction = .up
        self.view?.addGestureRecognizer(swipeD)
        swipeU.direction = .down
        self.view?.addGestureRecognizer(swipeU)
        addChild(backgroundNode)
        grassNode = SKSpriteNode(texture: SKTexture(image:#imageLiteral(resourceName: "snow_land")))
        grassNode.position = CGPoint(x: 0, y: -screenHeight / 1.58)
        grassNode.size = CGSize(width: screenWidth, height: screenHeight / 1.6)
        grassNode.zPosition = 1
        backgroundNode.addChild(grassNode)
    }
    
    @objc func swipedDown() {
        //450
        if(backgroundNode.position.y < screenHeight / 1.67) {
            let move = SKAction.moveBy(x: 0, y: screenWidth / 1.2, duration: 0.5)
            backgroundNode.run(move)
        }
    }
    
    @objc func swipedUp() {
        if(backgroundNode.position.y > screenWidth / 1.5){
           let move = SKAction.moveBy(x: 0, y: -screenWidth / 1.2, duration: 0.5)
            backgroundNode.run(move)
        }
    }
    
    func addCloud(){
        let cloud1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "cloud4")))
        cloud1.position = CGPoint(x:screenWidth/3.75,y: screenHeight/1.075)
        cloud1.size = CGSize(width: screenWidth/2.21, height: screenWidth/6.25)
        cloud1.zPosition = 1
        let cloud2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "cloud1")))
        cloud2.position = CGPoint(x:-screenWidth/2.78,y: screenHeight/1.13)
        cloud2.size = CGSize(width: screenWidth/4.17, height: screenWidth/11.72)
        cloud2.zPosition = 1
        let cloud3 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "cloud2")))
        cloud3.position = CGPoint(x:screenWidth/4.07,y: screenHeight/1.315)
        cloud3.size = CGSize(width: screenWidth/6.15, height: screenWidth/17.85)
        cloud3.zPosition = 1
        let cloud4 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "cloud2")))
        cloud4.position = CGPoint(x:-screenWidth/4.41,y: screenHeight/1.42)
        cloud4.size = CGSize(width: screenWidth/3.5, height: screenWidth/9.87)
        cloud4.zPosition = 1
        backgroundNode.addChild(cloud1)
        backgroundNode.addChild(cloud2)
        backgroundNode.addChild(cloud3)
        backgroundNode.addChild(cloud4)
    }
    
    func shineAdd(){
        shineEmitter = SKEmitterNode(fileNamed: "MyParticle.sks")!
        shineEmitter.position = CGPoint(x: screenWidth/2, y: screenHeight)
        shineEmitter.zPosition = 2
        shineEmitter.isHidden = false
        addChild(shineEmitter)
    }
    
    func labe1(){
        nameMama = SKLabelNode(fontNamed: "Noteworthy-Bold")
        nameMama.position = CGPoint(x: -screenWidth/187.5, y: screenHeight/1.235)
        nameMama.fontColor = .BlueColor
        nameMama.fontSize = screenWidth / 18.75
        nameMama.text = "Мама,"
        nameMama.zPosition = 2
        nameMama.isHidden  = false
        nameKaz = SKLabelNode(fontNamed: "Noteworthy-Bold")
        nameKaz.position = CGPoint(x: 0, y: screenHeight/1.312)
        nameKaz.fontColor = .BlueColor
        nameKaz.text = "қазақша сөйлеші!"
        nameKaz.isHidden = false
        nameKaz.fontSize = screenWidth / 18.75
        nameKaz.zPosition = 2
        backgroundNode.addChild(nameMama)
        backgroundNode.addChild(nameKaz)
        aselS = SKLabelNode(fontNamed: "Noteworthy-Light")
        aselS.position = CGPoint(x: 0, y: screenHeight/1.39)
        aselS.isHidden = false
        aselS.fontColor = .orangeColor
        aselS.text = "Сапакова Асель"
        aselS.fontSize = screenWidth / 23.437
        aselS.zPosition = 2
        backgroundNode.addChild(aselS)
    }
    func cloudsName(){
        let girland1 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "girlyanda1")))
        girland1.position = CGPoint(x: 0, y: screenWidth / 1.82)
        girland1.size = CGSize(width: screenWidth, height: screenWidth / 2.72)
        girland1.zPosition = 4
        backgroundNode.addChild(girland1)
        
        let girland2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "girlyanda2")))
        girland2.position = CGPoint(x: 0, y: -screenWidth / 5)
        girland2.size = CGSize(width: screenWidth, height: screenWidth / 2.72)
        girland2.zPosition = 3
        backgroundNode.addChild(girland2)
        
        takpakN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "takpaktar")))
        takpakN.zPosition = 4
        takpakN.position = CGPoint(x: -screenWidth / 6.25, y: screenWidth / 1.5)
        takpakN.size = CGSize(width: screenWidth / 1.5625, height: screenWidth / 3.57)
        takpakN.name = "takpak"
        backgroundNode.addChild(takpakN)
        
         anderN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "ander")))
        anderN.zPosition = 4
        anderN.position = CGPoint(x: screenWidth / 3.95, y: screenWidth / 3.125)
        anderN.size = CGSize(width: screenWidth / 2.2, height: screenWidth / 3.75)
        anderN.name = "ander"
        backgroundNode.addChild(anderN)
        
        skorogovN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "zhanyltpash")))
        skorogovN.zPosition = 4
        skorogovN.position = CGPoint(x:-screenWidth / 37.5, y: -screenWidth / 18.75)
        skorogovN.size = CGSize(width: screenWidth / 1.14, height: screenWidth / 3.44)
        skorogovN.name = "skorogovor"
        backgroundNode.addChild(skorogovN)
        
        sanamakN = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "sanamak")))
        sanamakN.zPosition = 4
        sanamakN.position = CGPoint(x: screenWidth / 7.5, y: -screenWidth / 2.2)
        sanamakN.size = CGSize(width: screenWidth / 1.46, height: screenWidth / 4.31)
        sanamakN.name = "sanamak"
        backgroundNode.addChild(sanamakN)
    }
    func connect(){
        wRect = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "kamile")))
        wRect.position = CGPoint(x: 0, y: -screenWidth / 7.5)
        wRect.size = CGSize(width: screenWidth / 1.63, height: screenWidth / 1.63)
        wRect.zPosition = 3
        grassNode.addChild(wRect)
        
        let present = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "present")))
        present.position = CGPoint(x: 0, y: -screenWidth/2.5)
        present.size = CGSize(width: screenWidth / 17.85, height: screenWidth / 18.75)
        present.zPosition = 4
        grassNode.addChild(present)
       
        let twoSon = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "twosons")))
        twoSon.position = CGPoint(x: screenWidth/2.69, y: screenWidth/7.5)
        twoSon.size = CGSize(width: screenWidth / 5, height: screenWidth / 3.75)
        twoSon.zPosition = 4
        grassNode.addChild(twoSon)
        
        let oneSon = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "big_son (1)")))
        oneSon.position = CGPoint(x: -screenWidth/3.28, y: -screenWidth/4.19)
        oneSon.size = CGSize(width: screenWidth / 9.15, height: screenWidth / 2.58)
        oneSon.zPosition = 4
        grassNode.addChild(oneSon)
        
        let littleSon = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "1son")))
        littleSon.position = CGPoint(x: screenWidth/4.3, y: -screenWidth/2.69)
        littleSon.size = CGSize(width: screenWidth / 8.33, height: screenWidth / 8.33)
        littleSon.zPosition = 4
        grassNode.addChild(littleSon)
        
        let singleLadies = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "copyright")))
        singleLadies.position = CGPoint(x: 0, y: -screenWidth / 1.97)
        singleLadies.size = CGSize(width: screenWidth / 15, height: screenWidth / 37.5)
        singleLadies.zPosition = 4
        grassNode.addChild(singleLadies)
        
    }
    func contactLabel(){
        let mam = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        mam.position = CGPoint(x: 0, y: screenWidth/5.1)
        mam.text = "Мама,"
        mam.zPosition = 4
        mam.fontSize = screenWidth / 23.437
        mam.fontColor = .BlueColor
        wRect.addChild(mam)
        let mam2 = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        mam2.position = CGPoint(x: 0, y: screenWidth/6.4)
        mam2.text = "қазақша сөйлеші!"
        mam2.zPosition = 4
        mam2.fontSize = screenWidth / 23.437
        mam2.fontColor = .BlueColor
        wRect.addChild(mam2)
        let govorim = SKLabelNode(fontNamed: "HelveticaNeue")
        govorim.position = CGPoint(x: 0, y: screenWidth/8.5)
        govorim.text = "Говорим с детьми на казахском"
        govorim.zPosition = 4
        govorim.fontSize = screenWidth / 31.25
        govorim.fontColor = .BlueColor
        wRect.addChild(govorim)
        
        let orangerect = SKShapeNode(rect: CGRect(x: -screenWidth/4.8, y:-5 , width: screenWidth/2.419, height: screenWidth/9.375), cornerRadius: 5)
        orangerect.fillColor = .orangeColor
        orangerect.strokeColor = .orangeColor
        orangerect.zPosition = 3
        orangerect.name = "Rate"
        wRect.addChild(orangerect)
        let ocenit = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        ocenit.zPosition = 4
        ocenit.position = CGPoint(x: 0, y: screenWidth / 37.5)
        ocenit.text = "Оценить приложение"
        ocenit.name = "Rate"
        ocenit.fontSize = screenWidth / 31.25
        ocenit.fontColor = .white
        orangerect.addChild(ocenit)
        let asel2 = SKLabelNode(fontNamed: "HelveticaNeue")
        asel2.position = CGPoint(x: 0, y: -screenWidth/17)
        asel2.text = "Сапакова Асель"
        asel2.zPosition = 4
        asel2.fontSize = screenWidth / 31.25
        asel2.fontColor = .BlueColor
        let asel3 = SKLabelNode(fontNamed: "HelveticaNeue")
        asel3.position = CGPoint(x: 0, y: -screenWidth/11)
        asel3.text = "совместно с журналом"
        asel3.zPosition = 4
        asel3.fontSize = screenWidth / 31.25
        asel3.fontColor = .BlueColor
        let asel4 = SKLabelNode(fontNamed: "HelveticaNeue")
        asel4.position = CGPoint(x: 0, y: -screenWidth/8)
        asel4.text = "«Зерек Ботақан»"
        asel4.zPosition = 4
        asel4.fontSize = screenWidth / 31.25
        asel4.fontColor = .BlueColor
        wRect.addChild(asel2)
        wRect.addChild(asel3)
        wRect.addChild(asel4)
        
        let instaT = SKLabelNode(fontNamed: "HelveticaNeue")
        instaT.position = CGPoint(x: 0, y: -screenWidth/5.7)
        instaT.text = "@kaz_for_moms"
        instaT.zPosition = 4
        instaT.fontSize = screenWidth / 31.25
        instaT.fontColor = .BlueColor
        wRect.addChild(instaT)
        let instaLogo = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "instagram")))
        instaLogo.position = CGPoint(x: -screenWidth/6.9, y: -screenWidth/6.15)
        instaLogo.size = CGSize(width: screenWidth/31.25, height: screenWidth/31.25)
        instaLogo.zPosition = 3
        wRect.addChild(instaLogo)
        let instaT2 = SKLabelNode(fontNamed: "HelveticaNeue")
        instaT2.position = CGPoint(x: 0, y: -screenWidth/4.7)
        instaT2.text = "www.zerekbotaqan.com"
        instaT2.zPosition = 4
        instaT2.fontSize = screenWidth / 31.25
        instaT2.fontColor = .BlueColor
        wRect.addChild(instaT2)
        let instaLogo2 = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "web")))
        instaLogo2.position = CGPoint(x: -screenWidth/5, y: -screenWidth/5)
        instaLogo2.size = CGSize(width: screenWidth/31.25, height: screenWidth/31.25)
        instaLogo2.zPosition = 3
        wRect.addChild(instaLogo2)
    }
    func soundButton(){
        let circle = SKShapeNode(circleOfRadius: screenWidth/15)
        circle.position = CGPoint(x: screenWidth/2.67, y: screenHeight/1.1)
        circle.strokeColor = .black
        circle.fillColor = UIColor.init(red: 103/255, green: 198/255, blue: 216/255, alpha: 1.0)
        circle.zPosition = 4
        circle.name = "musicButton"
        circle.glowWidth = screenWidth/1250
        backgroundNode.addChild(circle)
        
        musicON = SKTexture(image:#imageLiteral(resourceName: "sound_on"))
        musicOFF = SKTexture(image: #imageLiteral(resourceName: "sound_off"))
        if Model.sharedInstance.sound == true{
            musicButton = SKSpriteNode(texture: musicON)
        }else {
            musicButton = SKSpriteNode(texture: musicOFF)
        }
        
        musicButton.isHidden = false
        musicButton.position = CGPoint(x: 0, y: 0)
        musicButton.size = CGSize(width: screenWidth/15.625, height: screenWidth/15.625)
        musicButton.zPosition = 4
        musicButton.name = "musicButton"
        circle.addChild(musicButton)
    }
}

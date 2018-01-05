import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        let skView = SKView(frame: screenBounds)
        skView.ignoresSiblingOrder = true
        skView.showsPhysics = true
        skView.backgroundColor = .clear
        view.addSubview(skView)
        
        let scene = GameScene(size: CGSize(width: screenWidth, height: screenHeight))
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
}


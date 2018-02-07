import UIKit
import EasyPeasy

class MenuViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView  = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: 0, height: 1300)
        scrollView.setContentOffset(scrollView.contentOffset, animated: false)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    let backgraundImage: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 0, y: -10, width: screenWidth, height: screenWidth * 3.5))
        imgV.image = UIImage(named: "mainSummer.png")
        return imgV
    }()
    let musicBTN : MusicBtnMenu = {
        let btn = MusicBtnMenu()
        return btn
    }()
    let ballonsV: BallonsView = {
        let ballons = BallonsView(frame: CGRect(x: 78, y: 40, width: 250, height: 270))
        return ballons
    }()
    let headView: HeadTextView = {
        let view = HeadTextView(frame: CGRect(x: 106, y: 70, width: 165, height: 165))
        return view
    }()
    
    let btn: MenuButtons = {
        let view = MenuButtons(frame: CGRect(x: 0, y: 333, width: screenWidth, height: 600))
        return view
    }()
    let feedBackV: FeedBackView = {
        let view = FeedBackView(frame: CGRect(x: 78, y: 1017, width: 220, height: 220))
       return view
    }()
    let feedBackS: FeedBackSons = {
        let view = FeedBackSons(frame: CGRect(x: 0, y: 950, width: screenWidth, height: 339))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "summerBg"))
        scrollView.frame = view.frame
        view.addSubview(scrollView)
        scrollView.addSubview(backgraundImage)
        
        backgraundImage.addSubview(headView)
        backgraundImage.addSubview(ballonsV)
        scrollView.addSubview(musicBTN)

        scrollView.addSubview(btn)
        scrollView.addSubview(feedBackV)
        scrollView.addSubview(feedBackS)
        
        btn.takpakBtn.addTarget(self, action: #selector(goToTakpak), for: .touchUpInside)
        btn.anderBtn.addTarget(self, action: #selector(goToAnder), for: .touchUpInside)
        btn.zhanyltBtn.addTarget(self, action: #selector(goToZhanylt), for: .touchUpInside)
        btn.sanamakBtn.addTarget(self, action: #selector(goToSanamak), for: .touchUpInside)
        
        musicBTN.addTarget(self, action: #selector(songStatus), for: .touchUpInside)
        
        Timer.scheduledTimer(timeInterval: 5.5, target: self, selector: #selector(hiddenHeadText), userInfo: nil, repeats: true)
    }
    
    @objc func songStatus(){
                if Model.sharedInstance.sound == true{
                    musicBTN.setImage(UIImage(named:"sound_on.png"),for:.normal)
                    Model.sharedInstance.sound = false
                }else if Model.sharedInstance.sound == false{
                    musicBTN.setImage(UIImage(named:"sound_off.png"),for:.normal)
                    Model.sharedInstance.sound = true
                }
    }
    @objc func goToTakpak(){
        let vc = TakpaktarVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @objc func goToAnder(){
        let vc = AnderVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @objc func goToZhanylt(){
        let vc = ZhanyltViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @objc func goToSanamak(){
        let vc = SanamakViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func hiddenHeadText(){
        headView.isHidden = true
    }
   
 }


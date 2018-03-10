import UIKit
import EasyPeasy

class MenuViewController: UIViewController {
    
    var timer : Timer?
    fileprivate lazy  var scrollView: UIScrollView = {
        let scrollView  = UIScrollView()
        scrollView.contentSize = CGSize(width: 0, height: screenHeight * 1.95)
        scrollView.setContentOffset(scrollView.contentOffset, animated: false)
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    fileprivate lazy  var backgraundImage: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 0, y: -10, width: screenWidth, height: screenWidth * 3.5))
        imgV.image = UIImage(named: "mainSummer.png")
        return imgV
    }()
    fileprivate lazy  var musicBTN : MusicBtnMenu = {
        let btn = MusicBtnMenu(frame: CGRect(x: screenWidth / 1.229, y: screenWidth / 18.75, width: screenWidth / 7.5, height: screenWidth / 7.5))
        return btn
    }()
    fileprivate lazy  var ballonsV: BallonsView = {
        let ballons = BallonsView()
        return ballons
    }()
    fileprivate lazy  var headView: HeadTextView = {
        let view = HeadTextView()
//        frame: CGRect(x: 106, y: 70, width: 165, height: 165)
        return view
    }()
    
    fileprivate lazy  var btn: MenuButtons = {
        let view = MenuButtons(frame: CGRect(x: 0, y: screenWidth / 1.1261, width: screenWidth, height: screenHeight / 1.11166))
        return view
    }()
    fileprivate lazy  var feedBackV: FeedBackView = {
        let view = FeedBackView()
        return view
    }()
    fileprivate lazy  var feedBackS: FeedBackSons = {
        let view = FeedBackSons()
        return view
    }()
    fileprivate lazy  var progressView: ProgressBar = {
        let temp = ProgressBar(frame: CGRect(x: screenWidth / 4.6875, y: screenWidth / 1.93, width: screenWidth / 1.736, height: screenWidth / 1.5))
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.masksToBounds = false
        temp.layer.shadowOffset = CGSize(width: 3, height: 3)
        temp.layer.shadowOpacity = 0.3
        temp.layer.shadowRadius = 1
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "summerBg"))
//        view.frame = CGRect(x: 0, y: 0, width: screenWidth*4, height: screenHeight)
        scrollView.frame = view.frame
        view.addSubview(scrollView)
        scrollView.addSubview(backgraundImage)
        
        backgraundImage.addSubview(headView)
        backgraundImage.addSubview(ballonsV)
        scrollView.addSubview(musicBTN)
        print(screenHeight)
        
        scrollView.addSubview(btn)
        scrollView.addSubview(feedBackV)
        scrollView.addSubview(feedBackS)
        
        btn.takpakBtn.addTarget(self, action: #selector(goToTakpak), for: .touchUpInside)
        btn.anderBtn.addTarget(self, action: #selector(goToAnder), for: .touchUpInside)
        btn.zhanyltBtn.addTarget(self, action: #selector(goToZhanylt), for: .touchUpInside)
        btn.sanamakBtn.addTarget(self, action: #selector(goToSanamak), for: .touchUpInside)
        
        musicBTN.addTarget(self, action: #selector(songStatus), for: .touchUpInside)
        Layouts()
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
        scrollView.addSubview(progressView)
         timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timer1), userInfo: nil, repeats: true)
        progressView.progress.setProgress(0, animated: false)
//        let vc = TakpaktarVC()
//        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func timer1(){
//        progressView.progress.progress = 0.5
//        progressView.progress.setProgress(0, animated: true)
        if progressView.progress.progress  != 1{
            progressView.progress.progress += 2 / 10
//            progressView.removeFromSuperview()
        } else {
//            progressView.removeFromSuperview()
            timer?.invalidate()
            progressView.removeFromSuperview()
            let vc = TakpaktarVC()
            self.navigationController?.pushViewController(vc, animated: false)
        }
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
    
    func Layouts(){
        backgraundImage <- [
            Height(screenHeight),
            Width(screenWidth),
            Top(0),
            Left(0),
            Bottom(-10)
        ]
        scrollView <- [
            Height(screenHeight),
            Width(screenWidth),
            Top(0),
            Left(0),
            Bottom(0)
        ]
//        musicBTN <- [
//            Height(50),
//            Width(50),
//            Top(40),
//            Right(20)
//        ]
        headView <- [
            Height(165),
            Width(165),
            Top(70),
            Left(screenWidth / 3.57)
        ]
        feedBackV <- [
            Height(screenWidth / 1.7),
            Width(screenWidth / 1.7),
            Top(screenHeight / 0.65),
            Left(screenWidth / 4.4),
            Bottom(screenWidth / 6.95)
        ]
        feedBackS <- [
            Height(screenWidth / 1.1),
            Width(screenWidth),
            Top(screenHeight / 0.702),
            Left(0),
            Bottom(screenWidth / 6.95)
        ]
        ballonsV <- [
            Height(screenWidth / 1.388),
            Width(screenWidth / 1.5),
            Top(screenHeight / 9.375),
            Left(screenWidth / 6)
        ]
    }
}


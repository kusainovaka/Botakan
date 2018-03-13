//Second View
import UIKit
import EasyPeasy

class TakpakDetailsVC: UIViewController{
    
    var tempImage: Int = 0
    
    fileprivate lazy var detailsTakpakBG: BackgroundView = {
        let field = BackgroundView()
        field.isUserInteractionEnabled = true
        return field
    }()
    
    fileprivate lazy var detailsViewTakpakt: CollectionViewDetails = {
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
    let leftBTN: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    let rightBTN: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        return btn
    }()
    fileprivate lazy var nameTakpak: UILabel = {
        let takpakLB = UILabel()
        takpakLB.textColor = .BlueColor
        takpakLB.textAlignment = .center
        takpakLB.font = UIFont(name: "Noteworthy-Bold", size: screenWidth / 18.75)
        return takpakLB
    }()
    fileprivate lazy var takpak: UITextView = {
        let takpakLB = UITextView(frame: CGRect(x: screenWidth / 6, y: screenWidth / 3.5, width: screenWidth / 1.563, height: screenWidth / 1.3))
        takpakLB.textAlignment = NSTextAlignment.justified
        takpakLB.showsVerticalScrollIndicator = false
        takpakLB.isScrollEnabled = true
        takpakLB.isEditable = false
        takpakLB.textColor = .BlueColor
        takpakLB.font = UIFont(name: "Noteworthy-Light", size: screenWidth / 18.75)
        return takpakLB
    }()
    fileprivate lazy var  imageTakpak: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
        imgV.layer.cornerRadius = 5
        return imgV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailsTakpakBG)
        view.addSubview(detailsViewTakpakt)
        view.addSubview(leftBTN)
        view.addSubview(rightBTN)
        
        if tempImage != 0 || tempImage > 0{
        leftBTN.setImage(UIImage(named: ("\(tempParse[tempImage - 1].photo)")), for: .normal)
        }
        leftBTN.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        if tempImage == 0 || tempImage < 13 {
        rightBTN.setImage(UIImage(named: ("\(tempParse[tempImage + 1].photo)")), for: .normal)
        }
        rightBTN.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        
        detailsViewTakpakt.addSubview(nameTakpak)
        detailsViewTakpakt.addSubview(takpak)
        view.addSubview(imageTakpak)
        
        nameTakpak.text = tempParse[tempImage].name
        takpak.text = tempParse[tempImage].text
        imageTakpak.image = UIImage(named: ("\(tempParse[tempImage].photo)"))
        detailsTakpakBG.backBTN.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        setUpLayout()
    }
    
    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
    }
    
    @objc func leftAction(){
        if tempImage != 0 || tempImage > 0 {
            tempImage -= 1
            nameTakpak.text = tempParse[tempImage].name
            takpak.text = tempParse[tempImage].text
            imageTakpak.image = UIImage(named: ("\(tempParse[tempImage].photo).png"))
            if tempImage == 0 {
                leftBTN.setImage(UIImage(named: ("")), for: .normal)
            }else {
                leftBTN.setImage(UIImage(named: ("\(tempParse[tempImage - 1].photo)")), for: .normal)
            }
            rightBTN.setImage(UIImage(named: ("\(tempParse[tempImage + 1].photo)")), for: .normal)
            print("LEFT")
        }
        
    }
    @objc func rightAction(){
        if tempImage == 0 || tempImage < 13 {
            tempImage += 1
            nameTakpak.text = tempParse[tempImage].name
            takpak.text = tempParse[tempImage].text
            print("RIGHT")
            imageTakpak.image = UIImage(named: ("\(tempParse[tempImage].photo).png"))
            leftBTN.setImage(UIImage(named: ("\(tempParse[tempImage - 1].photo)")), for: .normal)
            rightBTN.setImage(UIImage(named: ("\(tempParse[tempImage + 1].photo)")), for: .normal)
        }
    }
    
    func setUpLayout(){
        detailsTakpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        nameTakpak <- [
            CenterX(0),
            Top(screenWidth / 25),
            Width(screenWidth / 1.5),
            Height(screenWidth / 11.72)
        ]
        leftBTN <- [
            Left(screenWidth / 7.9787),
            Top(screenWidth / 5.3571),
            Width(screenWidth / 4.6875),
            Height(screenWidth / 4.6875)
        ]
        rightBTN <- [
            Right(screenWidth / 7.9787),
            Top(screenWidth / 5.3571),
            Width(screenWidth / 4.6875),
            Height(screenWidth / 4.6875)
        ]
    }
}

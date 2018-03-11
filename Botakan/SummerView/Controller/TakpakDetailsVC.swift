//Second View
import UIKit
import EasyPeasy

class TakpakDetailsVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var tempImage: ParsingJSON?
    
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
    fileprivate lazy var tempCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.intoTakpakImage)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCellCV.self, forCellWithReuseIdentifier: "takpakImageCell")
        collectionView.reloadData()
        return collectionView
    }()
    fileprivate lazy var intoTakpakImage: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return layout
    }()
//    fileprivate lazy var leftImage: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.intoTakpakImage)
//        collectionView.backgroundColor = .clear
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(ImageCellCV.self, forCellWithReuseIdentifier: "takpakImageCell")
//        collectionView.reloadData()
//        return collectionView
//    }()
//    fileprivate lazy var leftImageLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        return layout
//    }()
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
        detailsViewTakpakt.addSubview(nameTakpak)
        detailsViewTakpakt.addSubview(takpak)
        view.addSubview(imageTakpak)
//        view.addSubview(tempCollectionView)
        
        nameTakpak.text = self.tempImage?.name
        takpak.text = self.tempImage?.text
        imageTakpak.image = UIImage(named: (self.tempImage?.photo)!)
        detailsTakpakBG.backBTN.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        setUpLayout()
//        print()
    }
    
    @objc func backToCV(){
        navigationController?.popViewController(animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "takpakImageCell", for: indexPath) as! ImageCellCV
//         cell.image.image = UIImage(named: tempParse[indexPath.row].photo)
        let strtemp = self.tempImage!.photo
        let tttt = Int(strtemp.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())

        cell.image.image = UIImage(named: (self.tempImage!.photo))
        let pict1 = "\(tttt! - 1)t"
        let pict2 = "\(tttt! + 1)t"
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
//        cell.imageView1.image = UIImage(named: pict1)
        cell.imageView2.image = UIImage(named: pict2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.tempCollectionView{
            print("TempCollectionTAKPAK")
        }
    }
    
    func setUpLayout(){
        detailsTakpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        tempCollectionView <- [
            Top(60),
            Width(screenWidth),
            Left(0),
            Height(130)
        ]
        nameTakpak <- [
        CenterX(0),
        Top(screenWidth / 25),
        Width(screenWidth / 1.5),
        Height(screenWidth / 11.72)
        ]
    }
}

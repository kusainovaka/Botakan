import UIKit
import EasyPeasy

class TakpakDetailsVC: UIViewController {
    
    var tempImage: ParsingJSON?
    var detailsTakpakBG: BackgroundView = {
        let field = BackgroundView()
        field.isUserInteractionEnabled = true
        return field
    }()
   
    let detailsViewTakpakt: CollectionViewDetails = {
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
    public lazy var tempCollectionView: UICollectionView = {
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
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return layout
    }()
//    let image: UIImageView = {
//        let imgV = UIImageView(frame: CGRect(x: screenWidth / 2.82, y: screenWidth / 7.5, width: screenWidth / 3.4, height: screenWidth / 3.4))
//        imgV.layer.cornerRadius = 5
//        return imgV
//    }()
//    let imageView1: UIImageView = {
//        let imgView = UIImageView()
//        imgView.contentMode = .scaleAspectFill
//        imgView.clipsToBounds = true
//        return imgView
//    }()
//    let imageView2: UIImageView = {
//        let imgView = UIImageView()
//        imgView.contentMode = .scaleAspectFill
//        imgView.clipsToBounds = true
//        return imgView
//    }()
    

    let backSanamakTakpak: UIButton = {
        let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
        backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
        return backBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(detailsTakpakBG)
        
        view.addSubview(detailsViewTakpakt)
//        view.addSubview(image)
//        view.addSubview(imageView1)
//        view.addSubview(imageView2)
        view.addSubview(backSanamakTakpak)
        view.addSubview(tempCollectionView)
//        detailsViewTakpakt.nameTakpak.text = self.tempImage?.name
//        detailsViewTakpakt.takpaktarText.text = self.tempImage?.text
//        getFromJSONtemp()
        backSanamakTakpak.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        setUpLayout()
    }
//    func getFromJSONtemp(){
//        do {
//            if let path = Bundle.main.url(forResource: "AllData", withExtension: "json") {
//                let url = try Data(contentsOf: path)
//                let jsonData = try
//                    JSONDecoder().decode([ParsingJSON].self, from: url)
//                self.tempImage = jsonData
//            } else { print("Error") }
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
    
   @objc func backToCV(){
    navigationController?.popViewController(animated: false)
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
//        imageView1 <- [
//            Width(screenWidth / 4.93),
//            Height(screenWidth / 4.93),
//            Top(screenWidth / 5.59),
//            Left(screenWidth / 7.978)
//        ]
//        imageView2 <- [
//            Width(screenWidth / 4.93),
//            Height(screenWidth / 4.93),
//            Top(screenWidth / 5.59),
//            Left(screenWidth / 1.48)
//        ]
    }
}

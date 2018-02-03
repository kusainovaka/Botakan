import UIKit
import EasyPeasy

var tempParse = [ParsingJSON]()
class TakpaktarVC: UIViewController{
//var tempParse = [ParsingJSON]()
    var s = TakpakDetailsVC()
    var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "Тақпақтар"
        return view
    }()
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.CVLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CLImage.self, forCellWithReuseIdentifier: "collectionCell")
        return collectionView
    }()
    var CVLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        return layout
    }()
    let backTakpak: UIButton = {
        let backBtn = UIButton(frame: CGRect(x: screenWidth / 18.75, y: screenWidth / 9.375, width: screenWidth / 11.574, height: screenWidth / 15.625))
        backBtn.setImage(#imageLiteral(resourceName: "Shape"), for: .normal)
        return backBtn
    }()
    
    var takpakBG: BackgroundView = {
        let field = BackgroundView ()
        field.isUserInteractionEnabled = true
        return field
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        getFromJSONtemp()
        
        view.addSubview(takpakBG)
        view.addSubview(detailLabel)
        view.addSubview(collectionView)
        view.addSubview(backTakpak)
        backTakpak.addTarget(self, action: #selector(backToBTN), for: .touchUpInside)
        layouyts()
    }
    
    func getFromJSONtemp(){
        do {
            if let path = Bundle.main.url(forResource: "AllData", withExtension: "json") {
                let url = try Data(contentsOf: path)
                let jsonData = try
                    JSONDecoder().decode([ParsingJSON].self, from: url)
                tempParse = jsonData
            } else { print("Error") }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    @objc func backToBTN(){
        navigationController?.popViewController(animated: false)
    }
    
    func layouyts(){
        takpakBG <- [
            Top(0),
            Width(screenWidth),
            Left(0),
            Height(screenHeight)
        ]
        collectionView <- [
            Top(screenWidth / 2.3),
            Width(screenWidth),
            Left(10),
            Height(screenHeight / 1.08)
        ]
    }
}

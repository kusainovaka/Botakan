import UIKit
import EasyPeasy

var tempParse = [ParsingJSON]()

class TakpaktarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate lazy  var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "   Тақпақтар"
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
    fileprivate lazy  var CVLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: screenWidth / 2.89, height: screenWidth / 2.89)
        layout.minimumLineSpacing = screenWidth / 10.71
        layout.minimumInteritemSpacing = screenWidth / 10.71
        layout.sectionInset = UIEdgeInsets(top: screenWidth / 10.71, left: screenWidth / 9.375, bottom: screenWidth / 10.71, right: screenWidth / 9.375)
        return layout
    }()
//    fileprivate lazy var tempViewL: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.tempViewLayp)
//        collectionView.backgroundColor = UIColor.clear
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(CLImage.self, forCellWithReuseIdentifier: "collectionCell")
//        return collectionView
//    }()
//    fileprivate lazy var tempViewLayp: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
//        return layout
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFromJSON()
        
        view.addSubview(detailLabel)
        view.addSubview(collectionView)
        
        detailLabel.backBTN.addTarget(self, action: #selector(backToBTN), for: .touchUpInside)
        Layouyts()
    }
    
    func getFromJSON(){
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
        if Model.sharedInstance.sound == true{
            player.play()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return tempParse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let one = tempParse[indexPath.row].photo
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CLImage
            cell.imageView.image = UIImage(named: one)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      about(place: tempParse[indexPath.row])
    }
    
    func about(place: ParsingJSON) {
        let vc = TakpakDetailsVC()
        vc.tempImage = place
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func Layouyts(){
        collectionView <- [
            Top(screenWidth / 2.3),
            Width(screenWidth),
            Left(0),
            Height(screenHeight / 1.08)
        ]
//        tempViewL <- [
//            Top(100),
//            Width(110),
//            Left(153),
//            Height(130)
//        ]
    }
}

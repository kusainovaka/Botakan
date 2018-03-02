import UIKit
import EasyPeasy

var tempParse = [ParsingJSON]()

class TakpaktarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var detailLabel: DetailLabels = {
        let view = DetailLabels(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 175))
        view.nameLabel.text = "     Тақпақтар"
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
    fileprivate lazy var tempViewL: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.tempViewLayp)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CLImage.self, forCellWithReuseIdentifier: "collectionCell")
        return collectionView
    }()
    fileprivate lazy var tempViewLayp: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        return layout
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getFromJSONtemp()
        
        view.addSubview(detailLabel)
        view.addSubview(collectionView)
        
        detailLabel.backBTN.addTarget(self, action: #selector(backToBTN), for: .touchUpInside)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.tempViewL{
            return 1
        }else {
            return tempParse.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       var one = tempParse[indexPath.row].photo
        if collectionView == self.tempViewL{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: one)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CLImage
            cell.imageView.image = UIImage(named: one)
        
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
           about(place: tempParse[indexPath.row])
            Model.sharedInstance.getName = [tempParse[indexPath.row - 1]]
            print(Model.sharedInstance.getName)
        }else {
        }
    }
    
    func about(place: ParsingJSON){
        let vc = TakpakDetailsVC()
//        Model.sharedInstance.getName = [place]
//        print(Model.sharedInstance.getName)
        vc.tempImage = place
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func layouyts(){
        collectionView <- [
            Top(screenWidth / 2.3),
            Width(screenWidth),
            Left(10),
            Height(screenHeight / 1.08)
        ]
        tempViewL <- [
            Top(100),
            Width(110),
            Left(153),
            Height(130)
        ]
    }
}

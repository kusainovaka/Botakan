import UIKit

extension GameScene: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempParse.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: tempParse[indexPath.row].photo)
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = tempParse[indexPath.row].photo
        let text = tempParse[indexPath.row].text
        let name =  tempParse[indexPath.row].name
        let takpakDetail = TakpakDetail()
        takpakDetail.takpakDeatilView()
        imageFromCv.image = UIImage(named: photo)
        takpak.text = text
        nameTakpak.text = name
        swipeToCvTakpak.addTarget(self, action: #selector(GameScene.backToCV))
        takpakView.addGestureRecognizer(swipeToCvTakpak)
        backToCVBtn.addTarget(self, action: #selector(backToCV), for: .touchUpInside)
        takpakView.addSubview(backToCVBtn)
    }
}



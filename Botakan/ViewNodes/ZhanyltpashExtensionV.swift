import UIKit

extension ZhanultpashScene: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return zhanylJS.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "znaylCollection", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: zhanylJS[indexPath.row].photo)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = zhanylJS[indexPath.row].name
        let text = zhanylJS[indexPath.row].text
        let photo = zhanylJS[indexPath.row].photo
        let zhanultDetail = ZhanyltDetails()
        zhanultDetail.zhanyltDeatilView()
        imageZhanylt.image = UIImage(named: photo)
        nameZhaylt.text = name
        zhanylt.text = text
        
        swipeToCvZhanylt.addTarget(self, action: #selector(ZhanultpashScene.two))
        view?.addGestureRecognizer(swipeToCvZhanylt)
        
        backZhanylt2.addTarget(self, action: #selector(two), for: .touchUpInside)
        view?.addSubview(backZhanylt2)
    }

}




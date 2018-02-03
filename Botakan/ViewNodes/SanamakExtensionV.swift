import UIKit

extension SanamakScene: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sanamakJS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sanamakCollection", for: indexPath) as! CLImage
        
        cell.imageView.image = UIImage(named: sanamakJS[indexPath.row].photo)
//        collectionView.collectionViewLayout.invalidateLayout()
        //        cell.transform = collectionView.transform
//        collectionView.reloadItems(at: [indexPath])
//        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.left, animated: true)
//        collectionView.setContentOffset(.zero, animated: true)
//        [self.collectionView,, performBatchUpdates:^{
//            [self.collectionView reloadData];
//            } completion:nil];
        
//        collectionView.performBatchUpdates(collectionView.reloadData, completion: nil)
        collectionView.reloadData()
        collectionView.performBatchUpdates(nil, completion: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = sanamakJS[indexPath.row].name
        let text = sanamakJS[indexPath.row].text
        let photo = sanamakJS[indexPath.row].photo
        let sanamakDetail = SanamakDetails()
        sanamakDetail.sanamakDeatilView()
        imageSana.image = UIImage(named: photo)
        nameSana.text = name
        sanamak.text = text

        swipeToCvSanamak.addTarget(self, action: #selector(SanamakScene.backBTNSanamak))
        view?.addGestureRecognizer(swipeToCvSanamak)
        
        backSanamak2.addTarget(self, action: #selector(backBTNSanamak), for: .touchUpInside)
        view?.addSubview(sanamak)
        view?.addSubview(backSanamak2)
    }
    
}


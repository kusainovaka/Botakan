import UIKit

extension TakpakDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "takpakImageCell", for: indexPath) as! ImageCellCV
//        cell.image.image = UIImage(named: tempParse[indexPath.row].photo)
        let strtemp = self.tempImage!.photo
        let tttt = Int(strtemp.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())

        cell.image.image = UIImage(named: (self.tempImage!.photo))
        let pict1 = "\(tttt! - 1)t"
        let pict2 = "\(tttt! + 1)t"
        cell.isSelected = true
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        cell.imageView1.image = UIImage(named: pict1)
        cell.imageView2.image = UIImage(named: pict2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Kamila")
        
    }
}




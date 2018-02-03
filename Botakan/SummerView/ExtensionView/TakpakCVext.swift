import UIKit
extension TakpaktarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempParse.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: tempParse[indexPath.row].photo)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let photo = tempParse[indexPath.row].photo
//        let text = tempParse[indexPath.row].text
//        let name =  tempParse[indexPath.row].name
//
////        var default1 = tempParse[indexPath.row].photo as NSString
////        let default2 = tempParse[indexPath.row + 1].photo as NSString
//        let aaaa = TakpakDetailsVC()
//        aaaa.detailsViewTakpakt.nameTakpak.text = name
//        aaaa.detailsViewTakpakt.takpaktarText.text = text
////        aaaa.image.image = UIImage(named: photo)
//
////        if default1.intValue == 1{
////        aaaa.imageView1.image = UIImage(named: "3s.sng")
////            aaaa.imageView2.image = UIImage(named: default2 as String)
////        }else{
////            default1 = tempParse[indexPath.row - 1].photo as NSString
////            aaaa.imageView1.image = UIImage(named: default1 as String)
////            aaaa.imageView2.image = UIImage(named: default2 as String)
////        }
//        navigationController?.pushViewController(aaaa, animated: false)
        about(place: tempParse[indexPath.row])
        if (collectionView == s.tempCollectionView){
            print ("1")
        }
        
    }
    func about(place: ParsingJSON){
        let vc = TakpakDetailsVC()
        vc.tempImage = place
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func scrollLeft(){
        print("TAPP")
    }
}



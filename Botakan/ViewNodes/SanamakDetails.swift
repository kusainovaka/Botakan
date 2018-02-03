
import UIKit
import EasyPeasy

class SanamakDetails : NSObject{
    
    func sanamakDeatilView(){
        backSanamak.removeFromSuperview()
        CVaLabelSanam.removeFromSuperview()
        CVSanamak.removeFromSuperview()
        swipeToCvSanamak.direction = .right
        UIView.animate(withDuration: 5.0, animations: {
            imageSana.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)})
        UIView.animate(withDuration: 2.0, animations: {
            imageSana.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)})
//        sanamakView.addSubview(defaultImageSana)
        sanamakView.addSubview(imageSana)
        sanamakView.addSubview(imageGirland)
        detailsViewSana.addSubview(nameSana)
        detailsViewSana.addSubview(sanamak)
        sanamakView.addSubview(detailsViewSana)
        sanamakView.addSubview(backSanamak2)
    }
}





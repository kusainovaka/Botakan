
import UIKit
import EasyPeasy

class ZhanyltDetails : NSObject{
    func zhanyltDeatilView(){
        backZhanylt1.removeFromSuperview()
        CVLabelzhanyl.removeFromSuperview()
        CVZhanyl.removeFromSuperview()
        UIView.animate(withDuration: 5.0, animations: {
            imageZhanylt.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)})
        UIView.animate(withDuration: 2.0, animations: {
            imageZhanylt.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)})
        swipeToCvZhanylt.direction = .right
//        zhanylView.addSubview(defaultImageZhanylt)
        zhanylView.addSubview(imageZhanylt)
        zhanylView.addSubview(imageGirland)
        detailsViewZh.addSubview(nameZhaylt)
        detailsViewZh.addSubview(zhanylt)
        zhanylView.addSubview(detailsViewZh)
        zhanylView.addSubview(backZhanylt2)
    }
}




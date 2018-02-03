
import UIKit
import EasyPeasy
import AVFoundation

class AnderDetails : NSObject{
    
    func anderDeatilView(){
        backToMenuBTN.removeFromSuperview()
        CVaLabelnder.removeFromSuperview()
        CVAnder.removeFromSuperview()
        swipeToCvAnder.direction = .right
        
        musicView.addSubview(durationMusic)
        musicView.addSubview(allDurationMusic)
        musicView.addSubview(nameAn)
        musicView.addSubview(leftMusic)
        musicView.addSubview(rightMusic)
        musicView.addSubview(nameArtist)
        musicView.addSubview(sliderMusic)
        
        anderView.addSubview(imageGirlandAn)
        detailsViewAn.addSubview(nameAnder)
        detailsViewAn.addSubview(ander)
        
        anderView.addSubview(musicView)

        musicView.addSubview(imageAnder)
        musicView.addSubview(btnMusic)
        anderView.addSubview(detailsViewAn)
        anderView.addSubview(backToMenuAnderVC)
    }
    
}



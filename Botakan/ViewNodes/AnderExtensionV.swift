import UIKit
import AVFoundation

extension AnderScene: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anderParse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "anderCollection", for: indexPath) as! CLImage
        cell.imageView.image = UIImage(named: anderParse[indexPath.item].photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = anderParse[indexPath.row].name
        let text = anderParse[indexPath.row].text
        let photo = anderParse[indexPath.row].photo
        let anderM = anderParse[indexPath.row].music
        let authorAN = anderParse[indexPath.row].author
        let anNameq = anderParse[indexPath.row].Anname

        do{
            let url = Bundle.main.url(forResource: "\(anderM)", withExtension: "mp3")
            AudioPlayer = try AVAudioPlayer(contentsOf: url!)
            AudioPlayer.prepareToPlay()
        }catch let error as NSError{
            print(error.debugDescription)
        }
    
        let anderkDetail = AnderDetails()

        anderkDetail.anderDeatilView()
        nameAnder.text = name
        ander.text = text
        imageAnder.image = UIImage(named: photo)
        nameAn.text = anNameq
        nameArtist.text = authorAN
        
        swipeToCvAnder.addTarget(self, action: #selector(AnderScene.backToAnderCBTN))
        anderView.addGestureRecognizer(swipeToCvAnder)

        backToMenuAnderVC.addTarget(self, action: #selector(backToAnderCBTN), for: .touchUpInside)
        anderView.addSubview(backToMenuAnderVC)
    }
}

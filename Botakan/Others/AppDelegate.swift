//First version
//download

import UIKit
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: screenBounds)
        window?.rootViewController = GameViewController()
        window?.makeKeyAndVisible()
        UIApplication.shared.isStatusBarHidden = true
        return true
    }
    
    func requestReview(){
        if #available(iOS 10.1, *){
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
            }
        }else{
            print("Rate is disable")
        }
        
    }
}


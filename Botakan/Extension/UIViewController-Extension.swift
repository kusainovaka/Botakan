//
//  UIViewController-Extension.swift
//  Botakan
//
//  Created by Kamila on 1/28/20.
//  Copyright © 2020 kusainovaka. All rights reserved.
//

import UIKit
import StoreKit

extension UIViewController {
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}

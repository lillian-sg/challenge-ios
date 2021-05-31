//
//  GokLoad.swift
//  ChallengeGOK
//
//  Created by Lilian on 24/04/21.
//

import Foundation
import UIKit

class GokLoad {
    static let shared = GokLoad()
    private let loadVc = LoadViewController()
    
    private init() {
        
    }
    
    func showLoad(_ show: Bool) {
        if show {
            guard let topVc = UIApplication.topViewController() else{
                return
            }
            topVc.present(loadVc, animated: true) {
                self.loadVc.start()
            }
        } else{
            loadVc.stop()
        }
    }
}


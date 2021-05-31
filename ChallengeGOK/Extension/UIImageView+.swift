//
//  UIImageView+.swift
//  ChallengeGOK
//
//  Created by Lilian on 17/04/21.
//

import UIKit

extension UIImageView {
   
    func setImage(imageUrl: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: imageUrl), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//
//  HeaderCollectionReusableView.swift
//  ChallengeGOK
//
//  Created by Lilian on 10/04/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak private var titleLabel: UILabel!
    
    
    func set(text: String) {
        titleLabel.text = text
    }
    
}

//
//  IconCollectionViewCell.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
                
    }
    func configureCell(iconUrl: String) {
        print(iconUrl)
        iconImage.setImage(imageUrl: iconUrl)
    }

}

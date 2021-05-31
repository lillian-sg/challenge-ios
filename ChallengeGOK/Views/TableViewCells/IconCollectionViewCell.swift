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
        let shadowColor = #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)
        let offSet = CGSize(width: 0, height: 5)
        iconView.addShadow(color: shadowColor, offSet: offSet, radius: 10, scale: true, opacity: 1.0)
        self.layoutIfNeeded()
    }


}

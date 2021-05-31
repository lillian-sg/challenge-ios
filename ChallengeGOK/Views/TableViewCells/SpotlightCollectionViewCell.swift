//
//  SpotlightCollectionViewCell.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var spotlightView: UIView!
    @IBOutlet weak var spotlightImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var conteinerSpotlightView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    func configureCell(hideTitle: Bool, imageUrl: String, title: String, shadow: Bool) {
        spotlightView.isHidden = hideTitle
        titleLabel.text = title
        spotlightImageView.setImage(imageUrl: imageUrl)
        spotlightImageView.clipsToBounds = true
        let radius: CGFloat = 10
        conteinerSpotlightView.layer.cornerRadius = radius
        spotlightImageView.layer.cornerRadius = radius
        if shadow {
            conteinerSpotlightView.addShadow(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), offSet: .zero, radius: radius, scale: true, opacity: 1)
            self.layoutIfNeeded()
            self.setNeedsLayout()
        }else {
            conteinerSpotlightView.clipsToBounds = true
        }
    }
    
}


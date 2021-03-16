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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    func configureCell(hideTitle: Bool, imageUrl: String, title: String) {
        spotlightView.isHidden = hideTitle
        titleLabel.text = title
        spotlightImageView.setImage(imageUrl: imageUrl)
    }
    
}
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

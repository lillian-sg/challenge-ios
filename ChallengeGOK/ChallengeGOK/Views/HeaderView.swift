//
//  HeaderView.swift
//  ChallengeGOK
//
//  Created by Lilian on 27/03/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "HeaderView"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func add(title: String) {
        titleLabel.text = title
    }
}

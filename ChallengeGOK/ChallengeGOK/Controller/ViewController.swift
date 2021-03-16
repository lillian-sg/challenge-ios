//
//  ViewController.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import UIKit

class ViewController: UIViewController {
      
    var contentNetwork = ContentNetwork()
    var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentNetwork.requestContent { (result) in
            switch result {
            case .success(let content):
                self.content = content
            case .failure(let error):
                print(error)
            }
        }
    }

}


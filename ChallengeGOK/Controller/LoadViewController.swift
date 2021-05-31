//
//  LoadViewController.swift
//  ChallengeGOK
//
//  Created by Lilian on 24/04/21.
//

import UIKit
import NVActivityIndicatorView

class LoadViewController: UIViewController {
    
    private var nvLoadView = NVActivityIndicatorView(frame: .zero)
    
    init() {
        super.init(nibName: "LoadViewController", bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLoadView()
        
    }
    
    private func addLoadView(){
        guard let window = UIApplication.shared.windows.first else { return }
        let originX = (window.bounds.width / 2) - 50
        let originY = (window.bounds.height / 2) - 50
        
        let frame = CGRect(x: originX, y: originY, width: 100, height: 100)
        
        nvLoadView = NVActivityIndicatorView(frame: frame, type: .ballRotateChase, color: .white, padding: nil)
        self.view.addSubview(nvLoadView)
    }
    
    func start(){
        nvLoadView.startAnimating()
    }
    
    func stop(){
        nvLoadView.stopAnimating()
        Dispatch.DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    
}

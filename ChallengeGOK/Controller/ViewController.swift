//
//  ViewController.swift
//  ChallengeGOK
//
//  Created by Lilian on 12/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginName: UILabel!
    @IBOutlet weak var spotlightCollectionView: UICollectionView!
    @IBOutlet weak var digioCashCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var titleProducts: UILabel!
    
    var contentNetwork = ContentNetwork()
    var content: Content?
    var spotlightName = "SpotlightCollectionViewCell"
    var iconCellName = "IconCollectionViewCell"
  //  let headerCollection = "HeaderCollectionReusableView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
      
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentNetwork.requestContent { (result) in
            //loadVc.stop()
            switch result {
            case .success(let content):
                self.content = content
                Dispatch.DispatchQueue.main.async {
                    self.reloadData()
                    self.titleProducts.text = "Produtos"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
   
    func setupCollectionView() {
        registerCell()
        spotlightCollectionView.dataSource = self
        digioCashCollectionView.dataSource = self
        productsCollectionView.dataSource = self
        spotlightCollectionView.delegate = self
        digioCashCollectionView.delegate = self
        productsCollectionView.delegate = self
    }
    
    private func registerCell() {
        let spotlightNib = UINib(nibName: spotlightName, bundle: nil)
        let iconNib = UINib(nibName: iconCellName, bundle: nil)
  //      let headerCollectionNib = UINib(nibName: "HeaderCollectionReusableView", bundle: nil)
        spotlightCollectionView.register(spotlightNib, forCellWithReuseIdentifier: spotlightName)
        digioCashCollectionView.register(spotlightNib, forCellWithReuseIdentifier: spotlightName)
        productsCollectionView.register(iconNib, forCellWithReuseIdentifier: iconCellName)
//        productsCollectionView.register(headerCollectionNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollection)
//        spotlightCollectionView.register(headerCollectionNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollection)
//        digioCashCollectionView.register(headerCollectionNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollection)
    }
    func reloadData() {
        DispatchQueue.main.async {
            self.spotlightCollectionView.reloadData()
            self.digioCashCollectionView.reloadData()
            self.productsCollectionView.reloadData()
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case spotlightCollectionView:
            return content?.spotlight?.count ?? 0
        case digioCashCollectionView:
            if content?.cash != nil {
                return 1
            }
            return 0
        default:
          return content?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case spotlightCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spotlightName, for: indexPath) as? SpotlightCollectionViewCell else {
                return UICollectionViewCell()
            }
            let spotlight = content?.spotlight?[indexPath.row]
            cell.configureCell(hideTitle: true, imageUrl: spotlight?.bannerURL ?? "", title: spotlight?.name ?? "", shadow: true)
            return cell
        case digioCashCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spotlightName, for: indexPath) as? SpotlightCollectionViewCell else{
                return UICollectionViewCell()
            }
            let digioCash = content?.cash
            cell.configureCell(hideTitle: false, imageUrl: digioCash?.bannerURL ?? "", title: digioCash?.title ?? "", shadow: false)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iconCellName, for: indexPath) as? IconCollectionViewCell else{
                return UICollectionViewCell()
            }
            let product = content?.products?[indexPath.row]
            cell.configureCell(iconUrl: product?.imageURL ?? "")
            return cell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch collectionView {
//        case productsCollectionView:
//            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollection, for: indexPath) as?  HeaderCollectionReusableView else{
//                return UICollectionReusableView()
//
//            }
//            headerView.set(text: "Coleção")
//
//            return headerView
//        default:
//            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollection, for: indexPath) as?  HeaderCollectionReusableView else{
//                return UICollectionReusableView()
//
//            }
//            headerView.set(text: "")
//            return headerView
//        }
//
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        let size = CGSize(width: productsCollectionView.bounds.width, height: 40.0)
//        return size
//    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case spotlightCollectionView, digioCashCollectionView:
            let screenBounds = UIScreen.main.bounds
            let width = screenBounds.width - 80.0
            let size = CGSize(width: width, height: 180.0)
            return size
        default:
            let size = CGSize(width: 160, height: 160)
            return size
        }
    }
    
}

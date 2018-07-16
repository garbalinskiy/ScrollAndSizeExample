//
//  ViewController.swift
//  ScrollAndSize
//
//  Created by Sergey Garbalinskiy on 7/16/18.
//  Copyright © 2018 Sergey Garbalinskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var headerViewController: HeaderViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHeader()
        
        collectionView.contentInset = UIEdgeInsetsMake(HeaderViewController.maxHeight, 0, 0, 0)
    }


    func addHeader() {
        headerViewController = HeaderViewController(nibName: String(describing: HeaderViewController.self), bundle: .main)
        headerViewController.view.frame = CGRect(x: 0, y: 30, width: view.frame.width, height: HeaderViewController.maxHeight)
        addChildViewController(headerViewController)
        view.addSubview(headerViewController.view)
        headerViewController.didMove(toParentViewController: self)
    }

}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleCell", for: indexPath) as! SampleCell
        cell.titleLabel.text = "Row N: \(indexPath.item)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerPreferedSize = scrollView.contentOffset.y < 0 ? scrollView.contentOffset.y * -1 : 0
        headerViewController.setPreferedHeight(headerPreferedSize)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

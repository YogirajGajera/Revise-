//
//  ViewController.swift
//  CollectionView
//
//  Created by mac on 21/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var img = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            img = ["1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6","1","2","3","4","5","6"]
    }

}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        cell.img_.image = UIImage(named: img[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "CollectionView", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let more = UIAlertAction(title: "MORE", style: .destructive, handler: {ACTION in
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
            secondVC.m_img = UIImage(named: self.img[indexPath.row]) ?? UIImage()
            
            self.navigationController?.pushViewController(secondVC, animated:true)
        })
        alert.addAction(ok)
        alert.addAction(more)
        self.present(alert,animated: true)
    }
    
}


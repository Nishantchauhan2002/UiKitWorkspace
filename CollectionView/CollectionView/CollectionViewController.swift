//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Nishant Chauhan on 25/01/24.
//

import UIKit

class CollectionViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var webImages:[String]=["i1","i2","i3","i4","i5","i6","i7"]
    
    
    @IBOutlet weak var mycollectionview: UICollectionView!
    
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mycollectionview.delegate=self
        mycollectionview.dataSource=self
        
        mycollectionview.register(UINib(nibName: "CollectionViewCell", bundle: nil)
                                , forCellWithReuseIdentifier:"HorizontalCell")
        
        verticalCollectionView.dataSource=self
        verticalCollectionView.delegate=self
        
        verticalCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "vertical")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell:CollectionViewCell
        
        if collectionView == mycollectionview{
           cell = mycollectionview.dequeueReusableCell(withReuseIdentifier: "HorizontalCell", for: indexPath) as! CollectionViewCell
            cell.Webimage.layer.cornerRadius=50.0

            
        }else{
          cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "vertical", for: indexPath)
            as! CollectionViewCell
            
        }
        
        cell.Webimage.image=UIImage(named: webImages[indexPath.row])
        
        return cell
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == mycollectionview{
//            let visibleCells=mycollectionview.visibleCells
//            for cell in visibleCells{
//                let distanceFromCenter = abs(cell.center.x - mycollectionview.center.x)
//
//                let scale=1.0 - min(distanceFromCenter/mycollectionview.bounds.width,0.5)
//
//                cell.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }
//        }
//
//    }
    
    

}

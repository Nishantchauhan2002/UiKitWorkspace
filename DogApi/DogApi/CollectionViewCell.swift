//
//  CollectionViewCell.swift
//  DogApi
//
//  Created by Nishant Chauhan on 19/01/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    static let identifier="photoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    override func prepareForReuse() {
        super .prepareForReuse()
        img.image=nil
    }

}

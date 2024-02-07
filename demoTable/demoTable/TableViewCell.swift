//
//  TableViewCell.swift
//  demoTable
//
//  Created by Nishant Chauhan on 17/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lbl2: UILabel!

    
    static let identifier="MyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

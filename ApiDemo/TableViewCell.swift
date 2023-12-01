//
//  TableViewCell.swift
//  ApiDemo
//
//  Created by ASWIN A on 30/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var phonePrice: UILabel!
    
    @IBOutlet weak var phoneDesc: UILabel!
    
    @IBOutlet weak var phoneTitle: UILabel!
    
    @IBOutlet weak var phoneImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

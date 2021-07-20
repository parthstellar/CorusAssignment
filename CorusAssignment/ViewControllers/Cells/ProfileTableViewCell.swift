//
//  ProfileTableViewCell.swift
//  CorusAssignment
//
//  Created by Apple on 20/07/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var lblDesignationInfo: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var lblBottomLine: UILabel!
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

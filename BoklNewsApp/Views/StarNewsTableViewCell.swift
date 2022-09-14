//
//  StarNewsTableViewCell.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 13/09/2022.
//

import UIKit

class StarNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var starBTN: UIButton!
    
    func setupCell(titleLabel: UILabel!, descriptionLabel: UILabel!, dateLabel: UILabel!, NewsImage: UIImageView!, starBTN: UIButton!) {
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
        self.dateLabel = dateLabel
//        self.NewsImage = NewsImage
//        self.starBTN = starBTN
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NewsCellsTableViewCell.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 13/09/2022.
//

import UIKit

class NewsCellsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var NewsImage: UIImageView!
    

    func setupCell(idx: Int, title: String, description: String, publishedAt: String, urlToImage: String){
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = publishedAt
        //image handling
        NewsImage.kf.setImage(with: URL(string: urlToImage)){result in
            switch result{
                case .failure:
                    self.NewsImage.image = UIImage(named: "noImage")
                default: return
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        NewsImage.layer.cornerRadius = NewsImage.layer.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

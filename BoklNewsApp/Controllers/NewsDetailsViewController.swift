//
//  NewsDetailsViewController.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 13/09/2022.
//

import UIKit
import Kingfisher

class NewsDetailsViewController: UIViewController {
    
    var newsDetails: NewsModel!
    
    @IBOutlet weak var NewsTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsDetailsTextView: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        receiveNewsDetails()
        assignValues()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }

    
    func assignValues(){
        NewsTitleLabel.text = newsDetails.title
        authorNameLabel.text = newsDetails.author
        dateLabel.text = newsDetails.publishedAt
        newsDetailsTextView.text = newsDetails.description
        newsImage.kf.setImage(with: URL(string: newsDetails.urlToImage ?? ""))
        
    }
    
    
}

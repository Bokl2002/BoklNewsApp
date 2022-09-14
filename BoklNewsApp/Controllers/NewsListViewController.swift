//
//  NewsViewController.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 12/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class NewsListViewController: UIViewController {
    
    // global vars
    var allNews: [NewsModel] = []
    
    // outlets
    @IBOutlet weak var newsTableView: UITableView!
    // no news (not found)
    @IBOutlet weak var noNewsLabel: UILabel!
    @IBOutlet weak var noNewsImage: UIImageView!
    @IBOutlet weak var noNewsBTN: UIButton!
    
    // view lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        // corners :)
        noNewsBTN.layer.cornerRadius = 20
        
    }
    override func viewWillAppear(_ animated: Bool) {
        isHiddenNewsList(hidden: false)
        isHiddenNoNews(hidden: true)
        
        // fetching News data according to the country
        let url = "https://newsapi.org/v2/top-headlines?country=\(countries[globalRow].Abbreviation)&apiKey=4a76e70726bc4f9599bac9f77af39ea6"
        AF.request(url).responseDecodable(of: AllNews.self) { response in
            if let data = response.value{
                self.allNews = data.articles
                // check if is empty
                if self.allNews.isEmpty{
                    self.isHiddenNewsList(hidden: true)
                    self.isHiddenNoNews(hidden: false)
                }else{
                    self.newsTableView.reloadData()
                }
            }
            
        }
    }
    
    // actions
    @IBAction func returnToChooseCountryBTN(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
}

//newsTableView
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCells", for: indexPath) as! NewsCellsTableViewCell
        let idx = indexPath.row
        let newsTitle = allNews[idx].title
        let newsDescription = allNews[idx].description
        let newsDate = allNews[idx].publishedAt
        let newSurlToImage = allNews[idx].urlToImage
        cell.setupCell(idx: idx, title: newsTitle, description: newsDescription ?? "", publishedAt: newsDate ?? "", urlToImage: newSurlToImage ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsVC") as? NewsDetailsViewController
        guard let VC = vc else{return}
        VC.newsDetails = allNews[indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
    }
}

//showAndHide
extension NewsListViewController{
    func isHiddenNoNews(hidden: Bool){
        noNewsLabel.isHidden = hidden
        noNewsImage.isHidden = hidden
        noNewsBTN.isHidden = hidden
    }
    func isHiddenNewsList(hidden: Bool){
        newsTableView.isHidden = hidden
    }
    
}



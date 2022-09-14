//
//  StarNewsViewController.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 13/09/2022.
//

import UIKit

class StarNewsViewController: UIViewController {

    var allNews: [NewsModel] = []
    
    @IBOutlet weak var starNewsTableView: UITableView!
    // no news (not found)
    @IBOutlet weak var noNewsLabel: UILabel!
    @IBOutlet weak var noNewsImage: UIImageView!
    @IBOutlet weak var noNewsBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starNewsTableView.delegate = self
        starNewsTableView.dataSource = self

    }
}
    

extension StarNewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarNewsCells", for: indexPath)
        cell.textLabel?.text = allNews[idx] as! String
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

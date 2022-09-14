//
//  NewsModel.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 13/09/2022.
//

import Foundation

struct NewsModel: Decodable{
    var title: String
    var author: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
}

struct AllNews: Decodable{
    var articles: [NewsModel]
}

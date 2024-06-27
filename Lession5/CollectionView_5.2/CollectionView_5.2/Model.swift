//
//  Model.swift
//  CollectionView_5.2
//
//  Created by Quang Phạm on 17/6/24.
//

import Foundation

class Model : Codable{
    let thumbnail: String
    let commentsCount: Int
    let likeCount: Int
    let viewCount: Int
    let models: String
    
    init(thumbnail: String, commentsCount: Int, likeCount: Int, viewCount: Int, models: String) {
        self.thumbnail = thumbnail
        self.commentsCount = commentsCount
        self.likeCount = likeCount
        self.viewCount = viewCount
        self.models = models
    }
}


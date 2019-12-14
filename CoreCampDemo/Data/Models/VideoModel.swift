//
//  VideoModel.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import Foundation

class VideoModel {
    var title: String
    var descriprion: String
    var imageUrl: URL { return URL(string: "https://i.ytimg.com/vi/\(youtubeId)/maxresdefault.jpg")! }
    var youtubeId: String
    var releaseDate: Date?
    var skaters: [SkaterModel]
    var durationSeconds: Int
    
    var durationString: String {
        let minutes = durationSeconds / 60;
        let seconds = durationSeconds % 60;

        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    init(title: String, descriprion: String, youtubeId: String, releaseDate: Date? = nil, skaters: [SkaterModel] = [], durationSeconds: Int = 0) {
        self.title = title
        self.descriprion = descriprion
        self.youtubeId = youtubeId
        self.releaseDate = releaseDate
        self.skaters = skaters
        self.durationSeconds = durationSeconds
    }
}

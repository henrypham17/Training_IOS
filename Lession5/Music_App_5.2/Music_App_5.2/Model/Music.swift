//
//  Music.swift
//  Music_App_5.2
//
//  Created by Quang Phạm on 25/6/24.
//

import Foundation
import UIKit


struct Section: Codable {
    let VIETNAM: [Info]
    let USUK: [Info]
    
    private enum CodingKeys:String, CodingKey {
        case VIETNAM
        case USUK = "US-UK"
    }
}

struct Info: Codable {
    let id: Int
    let thumbnail_url: String
    let music_title: String
    let music_artist: String
    let music_downloads: String
    let music_listen: String
    
}

//extension Info {
//    func getQualityInfo() -> (UIColor) {
//        switch music_listen {
//        case let x where x >= 1080:
//            return (UIColor.red)
//        case let x where x >= 720:
//            return (UIColor.orange)
//        case let x where x >= 480:
//            return (UIColor.blue)
//        case let x where x >= 360:
//            return (UIColor.green)
//        case let x where x >= 240:
//            return (UIColor.purple)
//        default:
//            return (UIColor.black)
//        }
//    }
//}

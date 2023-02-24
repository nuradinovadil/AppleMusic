//
//  Constants.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import Foundation
import UIKit

struct Constants {
    
    struct Identifiers {
        static let topPickCollectionViewCell = "TopPickCollectionViewCell"
        static let albumCollectionViewCell = "AlbumCollectionViewCell"
        static let albumTableViewCell = "AlbumTableViewCell"
        static let playedCollectionViewCell = "PlayedCollectionViewCell"
        static let forYourselfTableViewCell = "ForYourselfTableViewCell"
        static let searchCollectionViewCell = "SearchCollectionViewCell"
    }
    
    struct Values {
        static let arrayOfAlbums: [String] = ["Плейлисты", "Артисты", "Альбомы", "Песни"]
        static let arrayOfImages: [String] = ["music.note.list", "music.mic", "square.stack", "music.note"]
    }
    
    struct Colors {
        let selectedColor = UIColor(red: 248/255, green: 45/255, blue: 72/255, alpha: 1)
        
    }
}

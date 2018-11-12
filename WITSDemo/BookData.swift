//
//  BookData.swift
//  WITSDemo
//
//  Created by Kondya on 12/11/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

import Foundation
import UIKit

struct BookDataModel:Codable {
    
    var BookData : BookDataModel1
}

struct BookDataModel1 : Codable {
    
    var book : [bookArrayModel]
   
}
struct  bookArrayModel : Codable{
    var type : String?
    var title : String?
    var authorName : String?
    var ImageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Title"
        
        case authorName = "AutorFName1"
        case ImageUrl = "ThumbURL"
    }
    
}


struct MusicDataModel:Codable {
    
    var iTunes : MusicDataModel1
}

struct MusicDataModel1 : Codable {
    
    var itune : [musicArrayModel]
    
}
struct  musicArrayModel : Codable{
    var type : String?
    var title : String?
    var authorName : String?
    var ImageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Kategorie"
        
        case authorName = "ShortName"
        case ImageUrl = "ThumbURL"
    }
    
}

struct GameDataModel:Codable {
    
    var GamesData : GameDataModel1
}

struct GameDataModel1 : Codable {
    
    var game : [gameArrayModel]
    
}
struct  gameArrayModel : Codable{
    var type : String?
    var title : String?
    var authorName : String?
    var ImageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Title"
        
        case authorName = "ShortName"
        case ImageUrl = "ThumbURL"
    }
    
}



//
//  model.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/16/21.
//

import Foundation

struct result: Codable{
   public var data : Info
}

struct Info : Codable {
    public var movies : [movies]
}

struct movies: Codable{
    public var title : String
    public var summary : String
    public var year : Int
    public var rating : Double
    public var large_cover_image : String
}

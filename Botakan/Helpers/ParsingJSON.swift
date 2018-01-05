//
//  ParsingJSON.swift
//  mamakaz
//
//  Created by Kamila Kusainova on 02.12.17.
//  Copyright © 2017 kusainovaka. All rights reserved.
//

import Foundation

 struct ParsingJSON: Decodable {
    var id: Int
    var name: String
    var photo: String
    var text: String
    
}
    
    struct AnderJSON: Decodable {
        var id: Int
        var name: String
        var photo: String
        var text: String
        var music: String
        var author: String
        var Anname: String

//    public init(id:Int,name:String,text:[String]){
//        self.id = id
//        self.name = name
//        self.text = text
//    }
//
//     init(json: [String: Any]) {
//         id = json["id"] as? Int ?? -1
//         name = json["name"] as? String ?? ""
//         photo = json["photo"] as? String ?? ""
//         text = json["text"] as? String ?? ""
//    }
//    self.name = name
//    self.id = id
//    self.text = text
//
//    }
}

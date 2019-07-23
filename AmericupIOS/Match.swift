//
//  Match.swift
//  Americup
//
//  Created by Enfasis on 7/13/19.
//  Copyright © 2019 Santiago. All rights reserved.
//

import Foundation
import UIKit

struct Match {
    //Defines the properties for each Book in the collection
    // static let defaultCover = UIImage(named: "book.jpg")!
    var equipo1:String
    var equipo2:String
    var score1:String
    var score2:String
   // var flag1: UIImage?
    var flag2: UIImage?
    static let defaultFlag = UIImage(named: "copabrasil.png")!
    //Use a default cover if none is set
    var flag1:UIImage {
        get {
            return image ?? Match.defaultFlag
        }
        set {
            image = newValue
        }
    }
    private var image:UIImage? = nil
    
    init(equipo1:String,equipo2:String,score1:String,score2:String,flag:UIImage? = nil) {
        self.equipo1 = equipo1
        self.equipo2 = equipo2
        self.score1 = score1
        self.score2 = score2
        self.image = flag
        //self.flag2 = flag2i
    }
}

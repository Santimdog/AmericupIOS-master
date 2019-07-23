//
//  Gmatch.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/23/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//

import Foundation
import UIKit
struct Gmatch {
    //Defines the properties for each Book in the collection
    // static let defaultCover = UIImage(named: "book.jpg")!
    var equipo1:String
    var equipo2:String
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
    
    init(equipo1:String,equipo2:String,flag:UIImage? = nil) {
        self.equipo1 = equipo1
        self.equipo2 = equipo2
        self.image = flag
        //self.flag2 = flag2i
    }
}

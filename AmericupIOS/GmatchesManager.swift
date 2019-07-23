//
//  GmatchesManager.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/23/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//


import Foundation
import UIKit

//Class to handle operations over the books collection
class GmatchesManager {
    
    //Store the books collection
    private lazy var gmatches:[Gmatch] = self.loadGmatches()
    //Store the number of books in the collection
    var gmatchCount:Int {return gmatches.count}
    
    //Get a book from the collection at a specific position
    func getGmatch(at index:Int)->Gmatch {
        return gmatches[index]
    }
    
    //Return the books collection
    private func loadGmatches()->[Gmatch] {
        //for now, loads a dummy hard-coded books collection
        return sampleGmatches()
    }
    
    //Add a book to the collection
    func addGmatch(_ gmatch:Gmatch) {
        gmatches.append(gmatch)
    }
    
    /*func updateGmatch(at index: Int, with match: Match) {
        matches[index] = match
    }*/
    
    func removeMatch(at index: Int) {
        gmatches.remove(at: index)
    }
    
    //Return a dummny collection of books according to Book structure
    private func sampleGmatches()->[Gmatch] {
        return [
            Gmatch(equipo1: "Colombia", equipo2: "Bra"),
            Gmatch(equipo1: "Chi", equipo2: "Qat"),
            Gmatch(equipo1: "Col", equipo2: "Bra"),
            //More items
        ]
    }
}

private var appSupportDirectory:URL = {
    let url = FileManager().urls(for:.applicationSupportDirectory,in: .userDomainMask).first!
    //Checks if directory exists
    if !FileManager().fileExists(atPath: url.path) {
        //Creates directory if necessary
        do {
            try FileManager().createDirectory(at: url,
                                              withIntermediateDirectories: false)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
        
    }
    //Returns the path
    return url
}()

//Gets URL to Books.db file
private var matchesFile:URL = {
    let filePath = appSupportDirectory.appendingPathComponent("matches").appendingPathExtension("db")
    print(filePath)
    if !FileManager().fileExists(atPath: filePath.path) {
        if let bundleFilePath = Bundle.main.resourceURL?.appendingPathComponent("matches").appendingPathExtension("db") {
            do {
                try FileManager().copyItem(at: bundleFilePath, to: filePath)
            } catch let error as NSError {
                //fingers crossed
                print("\(error.localizedDescription)")
            }
        }
    }
    return filePath
}()

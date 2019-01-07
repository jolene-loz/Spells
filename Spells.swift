//
//  Spells.swift
//  Midterm2
//
//  Created by J. Lozano on 12/8/18.
//  Copyright © 2018 J. Lozano. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Spells{
    var spellData: [SpellData] = []
    
    func getSpells(completed: @escaping () -> ()){
        let url = "https://potterspells.herokuapp.com/api/v1/spells"
        Alamofire.request(url).responseJSON{ response in
            print(response)
            switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    let numberOfSpells = json["results"].count
                    for index in 0...numberOfSpells-1{
                        let name = json["results"][index]["name"].stringValue
                        let description = json["results"][index]["description"].stringValue
                        let soundFile = json["results"][index]["soundFile"].stringValue
                        self.spellData.append(SpellData(name: name, description: description, soundFile: soundFile))
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
            completed()
        }
    }
}

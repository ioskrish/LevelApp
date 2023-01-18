//
//  DataConfig2.swift
//  Level App
//
//  Created by Trycatch Classes on 18/01/23.
//

import Foundation

class Data2{
    static func getData() -> [Activity]{
        let info = [
            Activity(Background: "tile3", title: "Gratitude", task: "Journal", XP: "10", min: "01"),
            Activity(Background: "tile4", title: "For Inner Peace", task: "Journal", XP: "10", min: "20")
        ]
        return info
    }
}

//
//  DataConfig.swift
//  Level App
//
//  Created by Trycatch Classes on 18/01/23.
//

import Foundation

class Data1{
    static func getData() -> [Goal]{
        let info = [
            Goal(Background: "tile1 ", title: "Day 2: Steps To Recharge ", task: "Meditation", mentor: "Muskaan", XP: "10", min: "10"),
            Goal(Background: "tile2", title: "Move Your Body ", task: "Workout", mentor: "", XP: "10", min: "17")
        ]
        return info
    }
}


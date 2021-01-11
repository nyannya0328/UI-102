//
//  Food.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

struct Food: Identifiable {
    
        var id = UUID().uuidString
        var title : String
        var price : String
        var description : String
        var image : String
    
}

var foods = [
    Food(title: "Ninja", price: "100円", description: "NinjaCake", image: "p1"),
    Food(title: "Punpkin", price: "200円", description: "A lot of", image: "p2"),
    Food(title: "Biking", price: "300円", description: "Confuse", image: "p3"),
    Food(title: "Meet", price: "400円", description: "Thickness", image: "p4"),
    Food(title: "Fire", price: "500円", description: "Fire Meet", image: "p5"),

]

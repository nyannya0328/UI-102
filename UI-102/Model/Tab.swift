//
//  Tab.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

struct Tab: Identifiable {
    var id = UUID().uuidString
    var tab : String
    var foods : [Food]
}

var tabs = [
    Tab(tab: "Order Again", foods: foods.shuffled()),
    Tab(tab: "Picked For You", foods: foods.shuffled()),
    Tab(tab: "Starters", foods: foods.shuffled()),
    Tab(tab: "Closer", foods: foods.shuffled()),

]

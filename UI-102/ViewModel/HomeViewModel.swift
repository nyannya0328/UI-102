//
//  HomeViewModel.swift
//  UI-102
//
//  Created by にゃんにゃん丸 on 2021/01/11.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset :CGFloat = 0
    
    @Published var show = false
    
    @Published var selected = tabs.first!.tab
}


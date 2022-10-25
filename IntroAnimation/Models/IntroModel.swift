//
//  IntroModel.swift
//  IntroAnimation
//
//  Created by Luciano Nicolini on 24/10/2022.
//

import Foundation
import SwiftUI

struct Intro: Identifiable {
    internal init(id: String = UUID().uuidString, imageName: String, title: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
    }
    
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    
}

var intros: [Intro] = [
    .init(imageName: "img1", title: "Relax"),
    .init(imageName: "img1", title: "Relax2"),
    .init(imageName: "img1", title: "Relax3")
]

//
//  featureTest.swift
//  Finance-app
//
//  Created by Fazil P on 17/05/2023.
//

import SwiftUI



VStack {
    Label("Text Only", systemImage: "heart")
        .font(.title)
        .labelStyle(.titleOnly)

    Label("Icon Only", systemImage: "star")
        .font(.title)
        .labelStyle(.iconOnly)

    Label("Both", systemImage: "paperplane")
        .font(.title)
        .labelStyle(.titleAndIcon)
}

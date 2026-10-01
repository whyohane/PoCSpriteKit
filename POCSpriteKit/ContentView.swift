//
//  ContentView.swift
//  POCSpriteKit
//
//  Created by Yohane Cavalcante on 28/09/26.
//

import SwiftUI
import SpriteKit

struct ContentView: View {

    private let scene: SKScene = {
        let scene = GameScene(size: CGSize(width: 600, height: 400))
        scene.scaleMode = .resizeFill
        return scene
    }()

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

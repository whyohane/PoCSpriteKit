//
//  GameScene.swift
//  POCSpriteKit
//
//  Created by Yohane Cavalcante on 28/09/26.
//

import Foundation
import SpriteKit

enum PhysicsCategory {
    static let kernel: UInt32 = 0x1 << 0
    static let bowl: UInt32 = 0x1 << 1
}

class GameScene: SKScene {

    private let background = SKSpriteNode(imageNamed: "Kitchen")
    private let corn = CornNode()
    private let bowl = BowlNode()

    override func didMove(to view: SKView) {
        backgroundColor = .clear
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

        background.zPosition = -1
        addChild(background)

        corn.zPosition = 1
        addChild(corn)

        bowl.zPosition = 2

        addChild(bowl)

        updateLayout()
    }

    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        updateLayout()
    }

    private func updateLayout() {
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = size

        corn.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
        bowl.position = CGPoint(x: size.width * 0.5, y: size.height * 0.28)

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        releaseKernels(touchedBy: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        releaseKernels(touchedBy: touches)
    }

    private func releaseKernels(touchedBy touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: self)
            for node in nodes(at: location) {
                guard let kernel = node as? SKSpriteNode,
                      kernel.name?.hasPrefix("kernel_") == true,
                      kernel.parent === corn else { continue }
                release(kernel)
            }
        }
    }

    private func release(_ kernel: SKSpriteNode) {
        let scenePosition = corn.convert(kernel.position, to: self)
        kernel.removeFromParent()
        kernel.position = scenePosition
        kernel.zPosition = 3

        let body = SKPhysicsBody(rectangleOf: kernel.size)
        body.categoryBitMask = PhysicsCategory.kernel
        body.collisionBitMask = PhysicsCategory.kernel | PhysicsCategory.bowl
        body.restitution = 0.2
        body.friction = 0.6
        kernel.physicsBody = body

        addChild(kernel)
    }
}

//
//  BowlNode.swift
//  POCSpriteKit
//
//  Created by Yohane Cavalcante on 30/09/26.
//

import SpriteKit

final class BowlNode: SKNode {

    private let bowlSize = CGSize(width: 180, height: 170)
    private let wallThickness: CGFloat = 8

    override init() {
        super.init()

        let sprite = SKSpriteNode(imageNamed: "bowl")
        sprite.size = bowlSize
        sprite.zPosition = 0
        addChild(sprite)

        addWalls()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addWalls() {
        let interiorWidth = bowlSize.width * 0.7
        let interiorHeight = bowlSize.height * 0.5
        let interiorBottomY = -bowlSize.height * 0.35

        let bottom = wallNode(size: CGSize(width: interiorWidth, height: wallThickness))
        bottom.position = CGPoint(x: 0, y: interiorBottomY)
        addChild(bottom)

        let left = wallNode(size: CGSize(width: wallThickness, height: interiorHeight))
        left.position = CGPoint(x: -interiorWidth / 2, y: interiorBottomY + interiorHeight / 2)
        addChild(left)

        let right = wallNode(size: CGSize(width: wallThickness, height: interiorHeight))
        right.position = CGPoint(x: interiorWidth / 2, y: interiorBottomY + interiorHeight / 2)
        addChild(right)
    }

    private func wallNode(size: CGSize) -> SKNode {
        let wall = SKNode()
        let body = SKPhysicsBody(rectangleOf: size)
        body.isDynamic = false
        body.categoryBitMask = PhysicsCategory.bowl
        wall.physicsBody = body
        return wall
    }
}

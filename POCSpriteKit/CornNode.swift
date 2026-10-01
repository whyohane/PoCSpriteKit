//
//  CornNode.swift
//  POCSpriteKit
//
//  Created by Yohane Cavalcante on 30/09/26.
//

import SpriteKit

final class CornNode: SKNode {

    private let cobSize = CGSize(width: 120, height: 220)
    private let kernelSize = CGSize(width: 22, height: 22)
    private let rows = 8
    private let columnsPerRow = 4
    private let kernelSpacing = CGSize(width: 24, height: 22)

    private(set) var kernels: [SKSpriteNode] = []

    override init() {
        super.init()

        let cob = SKSpriteNode(imageNamed: "sabugo")
        cob.size = cobSize
        cob.zPosition = 0
        addChild(cob)

        layoutKernels()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutKernels() {
        let totalRowsHeight = CGFloat(rows - 1) * kernelSpacing.height
        let totalColumnsWidth = CGFloat(columnsPerRow - 1) * kernelSpacing.width

        for row in 0..<rows {
            let y = CGFloat(row) * kernelSpacing.height - totalRowsHeight / 2
            let rowOffset: CGFloat = row.isMultiple(of: 2) ? 0 : kernelSpacing.width / 2

            for column in 0..<columnsPerRow {
                let x = CGFloat(column) * kernelSpacing.width - totalColumnsWidth / 2 + rowOffset

                let kernel = SKSpriteNode(imageNamed: "grao")
                kernel.size = kernelSize
                kernel.position = CGPoint(x: x, y: y)
                kernel.zPosition = 1
                kernel.name = "kernel_\(row)_\(column)"

                addChild(kernel)
                kernels.append(kernel)
            }
        }
    }
}

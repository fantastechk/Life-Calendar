//
//  EventDisplay.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/22/17.
//

import Foundation
import SpriteKit

class EventDisplay {
    
    var node: SKShapeNode
    
    let event: Event
    
    init(event: Event) {
        self.event = event
        
        let size = CGSize(width: 200, height: 150)
        
        node = SKShapeNode(rectOf: size)
        
        node.fillColor = .clear
        node.strokeColor = .clear
        
        let titleLabel = Label(text: event.title)
        titleLabel.fontSize = 16
        titleLabel.position = CGPoint(x: -(size.width / 2) + (titleLabel.width / 2) + 5,
                                      y: (size.height / 2) - (titleLabel.height / 2) - 15)

        node.addChild(titleLabel.node)
        
        let formatter = TimelineDateFormatter()
        let start = formatter.string(from: event.span.start)
        let end = formatter.string(from: event.span.end)
        let dateLabel = Label(text: "\(start) ┄ \(end)")
        dateLabel.fontSize = 12
        dateLabel.position = CGPoint(x: -(size.width / 2) + (dateLabel.width / 2) + 5,
                                     y: (size.height / 2) - (dateLabel.height / 2) - 30 - titleLabel.height)
        
        node.addChild(dateLabel.node)
        
        // Create the top bar line
        let topY = node.frame.height/2
        let leftX = (node.frame.width / 2) * -1
        let rightX = (node.frame.width / 2)
        let line = Line(starting: CGPoint(x: leftX, y: topY), ending: CGPoint(x: rightX, y: topY))
        line.thickness = 0.5
        node.addChild(line.node)
    }
    
}

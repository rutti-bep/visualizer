//
//  graphDraw.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/24.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
import AppKit
import Cocoa

final class Graph: NSView{
    static let sharedInstance = Graph();
    var lineWidth:Float = 3.0
    var lineColor:CGColor = CGColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    var circleWidth:Float = 1.0
    var circleColor:CGColor = CGColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    var array = [Int8]();
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.cyan.set();
        let path = NSBezierPath()
        path.move(to: NSPoint(x:self.frame.minX,y:self.frame.minY))
        
        let widthSpace = self.frame.width/CGFloat(array.count);
        for i in 0..<array.count {
            //Swift.print(abs(array[i]))
            let absArray = array[i] >= 0 ? array[i] : abs(array[i]+1);
            let height = CGFloat(absArray)/127.0*self.frame.height;
            let width = widthSpace*CGFloat(i+1);
            let point = NSPoint(x:width,y:height)
            path.line(to: point)
       //     Swift.print(height)
       //     Swift.print(point)
        }
        path.stroke()
    }
    
}

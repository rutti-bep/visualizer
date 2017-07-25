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

var settingController = SettingController.sharedInstance;
var settingModel = SettingModel.sharedInstance;

final class Graph: NSView{
    static let sharedInstance = Graph();
    var spaceLimit:Int = 3;
    var array = [Int8]() {
        didSet{
            self._array = self.reduce(changeLimit: spaceLimit,newArray: self.array)
        }
    }
    private var _array = [Int8]()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        //self.reduce(3);
        
        settingModel.lineColor.set();
        let path = NSBezierPath()
       // path.move(to: NSPoint(x:self.frame.minX,y:self.frame.minY))
        
        let widthSpace = self.frame.width/CGFloat(_array.count);
        for i in 0..<_array.count {
            //Swift.print(abs(array[i]))
            //let absArray = array[i] >= 0 ? array[i] : abs(array[i]+1);
            let height = CGFloat(_array[i])/127.0 * self.frame.height * settingModel.heightParsent;
            let width = widthSpace*CGFloat(i);
            let point = NSPoint(x:width,y:height)
            if(i == 0){
                path.move(to: point)
            }else{
                path.line(to: point)
            }
       //     Swift.print(height)
       //     Swift.print(point)
        }
        path.stroke()
    }
    
    private func reduce(changeLimit:Int?=1,newArray:[Int8]) -> [Int8]{
        var change = 0;
        var reserve:Int8 = 0;
        var reduceArray = [Int8]()
        for i in 0..<array.count {
            let absArray = newArray[i] >= 0 ? newArray[i] : abs(newArray[i]+1);
            if(reserve < absArray){
                reserve = absArray
            }
            change += 1;
            if(change >= changeLimit!){
                reduceArray.append(reserve)
                reserve = 0;
                change = 0;
            }
        }
        return reduceArray;
    }
}

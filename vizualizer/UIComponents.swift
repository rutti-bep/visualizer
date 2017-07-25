//
//  UIComponents.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/25.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
import AppKit

class ColorSelector:NSView{
    var redSlider = NSSlider()
    var greenSlider = NSSlider()
    var blueSlider = NSSlider()
    var alphaSlider = NSSlider()
    var Color = NSColor.clear;
    
    func setup(target:AnyObject,selector:Selector?=#selector(ColorValueChange)){
        redSlider.target = target
        redSlider.action = selector;
        redSlider.floatValue = 0;
        self.addSubview(redSlider)
        greenSlider.target = target
        greenSlider.action = selector;
        greenSlider.floatValue = 0;
        self.addSubview(greenSlider)
        blueSlider.target = target
        blueSlider.action = selector;
        blueSlider.floatValue = 0;
        self.addSubview(blueSlider)
        alphaSlider.target = target
        alphaSlider.action = selector;
        alphaSlider.floatValue = 1;
        self.addSubview(alphaSlider)
        
    }
    
    func resize(){
        let frame = self.frame;
        redSlider.frame = NSRect(x:0,y:0,width:frame.width,height:frame.height/4)
        greenSlider.frame = NSRect(x:0,y:frame.height/4,width:frame.width,height:frame.height/4)
        blueSlider.frame = NSRect(x:0,y:frame.height/2,width:frame.width,height:frame.height/4)
        alphaSlider.frame = NSRect(x:0,y:frame.height/4*3,width:frame.width,height:frame.height/4)
    }
    
    func ColorValueChange (){
        Color = NSColor.init(red: CGFloat(redSlider.floatValue), green: CGFloat(greenSlider.floatValue), blue: CGFloat(blueSlider.floatValue), alpha: CGFloat(alphaSlider.floatValue))
    }
    
}

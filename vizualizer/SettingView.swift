//
//  SettingView.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/25.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
import AppKit

class SettingView:NSView {
    static let sharedInstance = SettingView();
    var heightChangeSlider = NSSlider()
    var backgroundColorSelector = ColorSelector();
    var lineColorSelector = ColorSelector();
    
    func setup(){
        heightChangeSlider.target = self;
        heightChangeSlider.action = #selector(heightChange);
        heightChangeSlider.floatValue = 0.5
        self.addSubview(heightChangeSlider)
        backgroundColorSelector.setup(target:self,selector:#selector(backgroundColorChange));
        self.addSubview(backgroundColorSelector)
        lineColorSelector.setup(target:self,selector:#selector(lineColorChange));
        lineColorSelector.layer?.backgroundColor = NSColor.red.cgColor
        self.addSubview(lineColorSelector)
    }
    
    func resize(){
        let frame = self.frame;
        heightChangeSlider.frame = NSRect(x:0,y:0,width:frame.width,height:frame.height/4)
        backgroundColorSelector.frame = NSRect(x:0,y:frame.height/4,width:frame.width,height:frame.height/4)
        backgroundColorSelector.resize();
        lineColorSelector.frame = NSRect(x:0,y:frame.height/2,width:frame.width,height:frame.height/4)
        lineColorSelector.resize();
        
    }
    
    func heightChange (){
        settingModel.heightParsent = CGFloat(heightChangeSlider.floatValue);
    }
    
    func backgroundColorChange(){
        backgroundColorSelector.ColorValueChange();
        Graph.sharedInstance.layer?.backgroundColor = backgroundColorSelector.Color.cgColor;
    }
    
    func lineColorChange(){
        lineColorSelector.ColorValueChange();
        settingModel.lineColor = lineColorSelector.Color;
    }
    
}

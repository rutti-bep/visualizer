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
    var audioUnitSelector = NSPopUpButton();
    var graphModeSelector = NSPopUpButton();
    var backgroundColorSelector = ColorSelector();
    var lineColorSelector = ColorSelector();
    var heightChangeSlider = NSSlider()
    
    var nowAudioDevice = "";
    var audioLists = Dictionary<String,UInt32>();
    
    func setup(){
        audioLists = try! getAudioDevices();
        audioUnitSelector.removeAllItems()
        audioUnitSelector.addItems(withTitles: Array(audioLists.keys))
        audioUnitSelector.target = SettingController.sharedInstance;
        audioUnitSelector.action = #selector(SettingController.sharedInstance.selectedAudioDevice)
        self.addSubview(audioUnitSelector)
        
        graphModeSelector.removeAllItems();
        for i in 0..<GraphMode.cases.count {
            graphModeSelector.addItem(withTitle: GraphMode.cases[i].rawValue);
        }
        graphModeSelector.target = SettingController.sharedInstance;
        graphModeSelector.action = #selector(SettingController.sharedInstance.selectedGraphMode)
        self.addSubview(graphModeSelector)
        
        backgroundColorSelector.setup(target:self,action:#selector(backgroundColorChange),title:"--background--");
        self.addSubview(backgroundColorSelector)
        lineColorSelector.setup(target:self,action:#selector(lineColorChange),title:"--line--");
        lineColorSelector.layer?.backgroundColor = NSColor.red.cgColor
        self.addSubview(lineColorSelector)
        heightChangeSlider.target = self;
        heightChangeSlider.action = #selector(heightChange);
        heightChangeSlider.floatValue = 0.5
        self.addSubview(heightChangeSlider)
        
    }
    
    func resize(){
        let frame = self.frame;
        audioUnitSelector.frame = NSRect(x:0,y:frame.height/4*3,width:frame.width/2,height:frame.height/8)
        graphModeSelector.frame = NSRect(x:frame.width/2,y:frame.height/4*3,width:frame.width/4,height:frame.height/8)
        backgroundColorSelector.frame = NSRect(x:0,y:frame.height/4,width:frame.width,height:frame.height/4)
        backgroundColorSelector.resize();
        lineColorSelector.frame = NSRect(x:0,y:frame.height/2,width:frame.width,height:frame.height/4)
        lineColorSelector.resize();
        heightChangeSlider.frame = NSRect(x:0,y:0,width:frame.width,height:frame.height/8)
        
    }
    
    func heightChange (){
        settingModel.heightParsent = CGFloat(heightChangeSlider.floatValue);
    }
    
    func backgroundColorChange(){
        Graph.sharedInstance.layer?.backgroundColor = backgroundColorSelector.Color.cgColor;
    }
    
    func lineColorChange(){
        settingModel.lineColor = lineColorSelector.Color;
    }
    
}

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
    var title = Label();
    var redText = Label();
    var greenText = Label();
    var blueText = Label();
    var alphaText = Label();
    var colorSampleView = Label();
    
    var actionButton = NSButton();
    var redSlider = NSSlider()
    var greenSlider = NSSlider()
    var blueSlider = NSSlider()
    var alphaSlider = NSSlider()
    var Color = NSColor.clear;
    
    func setup(target:AnyObject,action:Selector,title:String?=""){
        self.title.setup(defaultText: title,alignment: NSTextAlignment.left);
        self.addSubview(self.title);
        self.colorSampleView.setup();
        self.addSubview(self.colorSampleView);
        
        self.actionButton.title = "change";
        self.actionButton.target = target;
        self.actionButton.action = action;
        self.addSubview(actionButton)
        
        redText.setup(defaultText: "red");
        self.addSubview(redText)
        greenText.setup(defaultText: "green");
        self.addSubview(greenText)
        blueText.setup(defaultText: "blue");
        self.addSubview(blueText)
        alphaText.setup(defaultText: "alpha");
        self.addSubview(alphaText)
        
        redSlider.target = self;
        redSlider.action = #selector(ColorValueChange);
        redSlider.floatValue = 0;
        self.addSubview(redSlider)
        greenSlider.target = self
        greenSlider.action = #selector(ColorValueChange);
        greenSlider.floatValue = 0;
        self.addSubview(greenSlider)
        blueSlider.target = self
        blueSlider.action = #selector(ColorValueChange);
        blueSlider.floatValue = 0;
        self.addSubview(blueSlider)
        alphaSlider.target = self
        alphaSlider.action = #selector(ColorValueChange);
        alphaSlider.floatValue = 1;
        self.addSubview(alphaSlider)
    }
    
    func resize(){
        let frame = self.frame;
        self.title.frame = NSRect(x:20,y:frame.height/5*4,width:frame.width/4,height:frame.height/5)
        self.colorSampleView.frame = NSRect(x:20+frame.width/4,y:frame.height/5*4,width:frame.width/4,height:frame.height/5)
        self.actionButton.frame = NSRect(x:(20+frame.width/4)*2,y:frame.height/5*4,width:frame.width/4,height:frame.height/5)
        
        self.redText.frame = NSRect(x:0,y:frame.height/5*3,width:50,height:frame.height/5)
        self.greenText.frame = NSRect(x:0,y:frame.height/5*2,width:50,height:frame.height/5)
        self.blueText.frame = NSRect(x:0,y:frame.height/5*1,width:50,height:frame.height/5)
        self.alphaText.frame = NSRect(x:0,y:0,width:50,height:frame.height/5)
        
        
        self.colorSampleView.drawsBackground = true;
        
        redSlider.frame = NSRect(x:50,y:frame.height/5*3,width:frame.width-50,height:frame.height/5)
        greenSlider.frame = NSRect(x:50,y:frame.height/5*2,width:frame.width-50,height:frame.height/5)
        blueSlider.frame = NSRect(x:50,y:frame.height/5,width:frame.width-50,height:frame.height/5)
        alphaSlider.frame = NSRect(x:50,y:0,width:frame.width-50,height:frame.height/5)
    }
    
    func ColorValueChange (){
        Color = NSColor.init(red: CGFloat(redSlider.floatValue), green: CGFloat(greenSlider.floatValue), blue: CGFloat(blueSlider.floatValue), alpha: CGFloat(alphaSlider.floatValue))
        self.colorSampleView.backgroundColor = Color
    }
    
}

class Label: NSTextField {
    var text: String {
        get {
            return self.placeholderString!
        }
        
        set {
          self.stringValue = newValue
        }
    }
    
    func setup(defaultText:String?="",alignment:NSTextAlignment?=NSTextAlignment.center){
        self.stringValue = defaultText!;
        self.allowsEditingTextAttributes = false;
        self.alignment = alignment!;
        self.drawsBackground = false;
        self.isBordered = false;
        self.isEditable = false;
        self.isSelectable = false;
    }
    
    func resize(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,defaultText:String){
        self.frame = NSRect(x:x,y:y,width:width,height:height);
    }
}


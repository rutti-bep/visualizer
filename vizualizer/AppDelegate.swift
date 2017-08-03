//
//  AppDelegate.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/06/22.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Cocoa
import AppKit
import AVFoundation
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window:NSWindow?;
    var settingWindow:NSWindow?;
    
    var screenCounter = 0;
    
    var graphView = Graph.sharedInstance;
    let audioCatcher = AudioCatcher.sharedInstance;
    var settingController = SettingController.sharedInstance;
    var settingModel = SettingModel.sharedInstance;
    var settingView = SettingView.sharedInstance;
    
    func changeScreen(){
        screenCounter += 1;
        let screensCount = (NSScreen.screens()?.count)!;
        if screenCounter >= screensCount {
            screenCounter = 0;
        }
        Swift.print(screenCounter)
        let screen = NSScreen.screens()?[screenCounter]
        let point = NSPoint(x: screen!.frame.minX, y: screen!.frame.minY)
        let size = NSSize(width: screen!.frame.size.width, height: screen!.frame.size.height)
        window!.setFrameOrigin(point)
        window!.setContentSize(size);
        window!.makeKeyAndOrderFront(nil)
        
        graphView.frame.size = size;
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let screen:NSScreen = NSScreen.main()!
        window = NSWindow(contentRect:screen.frame, styleMask: [], backing: NSBackingStoreType.buffered, defer:false)
        window!.acceptsMouseMovedEvents = true
        window!.center()
        window!.isMovableByWindowBackground = true
        window!.backgroundColor = NSColor.clear
        window!.level = Int(CGWindowLevelForKey(.desktopWindow))
        window!.collectionBehavior = NSWindowCollectionBehavior.canJoinAllSpaces
        window!.makeKeyAndOrderFront(nil)
        
        graphView.frame = NSRect(x:0,y:0,width:window!.frame.width,height:window!.frame.height);
        graphView.wantsLayer = true
        window!.contentView?.addSubview(graphView);
        
        audioCatcher.initialize();
        
        settingWindow = NSWindow(contentRect:NSRect(x:0,y:0,width:500,height:500), styleMask: [.titled,.closable], backing: NSBackingStoreType.buffered, defer:true)
        settingWindow!.title = "vizualizer settings"
        settingWindow!.makeKeyAndOrderFront(nil)
        
        settingView.frame = settingWindow!.frame;
        settingView.setup();
        settingView.resize();
        settingWindow?.contentView = settingView
        
        //Swift.print(NSScreen.screens())
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

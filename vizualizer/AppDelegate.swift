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
    var graphView:Graph?;
    
    var audioCatcher:AudioCatcher = AudioCatcher.sharedInstance;

    func printBufs(){
        graphView!.needsDisplay = true
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let screen:NSScreen = NSScreen.main()!
        window = NSWindow(contentRect:screen.frame, styleMask: [], backing: NSBackingStoreType.buffered, defer:false)
       // window!.setContentSize(NSSize(width:screen.frame.width,height:screen.frame.height/2))
        window!.acceptsMouseMovedEvents = true
       // window!.title = "vizualizer"
        window!.center()
        window!.isMovableByWindowBackground = true
        window!.backgroundColor = NSColor.clear
        //window!.level = Int(CGWindowLevelForKey(.desktopWindow))
        window!.collectionBehavior = NSWindowCollectionBehavior.canJoinAllSpaces
        window!.makeKeyAndOrderFront(nil)

        graphView = Graph.sharedInstance;
        graphView!.frame = NSRect(x:0,y:0,width:window!.frame.width,height:window!.frame.height-20);
        graphView!.wantsLayer = true
        graphView!.layer?.backgroundColor = NSColor.clear.cgColor;
        window!.contentView?.addSubview(graphView!);
       
        graphView!.array = [127,30,-59,-127]
        
        
        try! print(getInputDevices());
        //fft()
        audioCatcher.initialize();
        audioCatcher.start();
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.printBufs), userInfo: nil, repeats: true)
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

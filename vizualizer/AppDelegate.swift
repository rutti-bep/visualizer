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
    
   // var myAudioPlayer:MyAudioPlayer!
    var audioCatcher:AudioCatcher = AudioCatcher.sharedInstance;

    func printBufs(){
        let array = audioCatcher.soundArray;
        graphView!.array = array
        graphView!.needsDisplay = true
        print(array);
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        window = NSWindow(contentRect: NSRect(x:NSScreen.main()!.frame.midX,y:NSScreen.main()!.frame.midY,width:400,height:400), styleMask: [.closable,.titled], backing: NSBackingStoreType.buffered, defer:false)
        window!.acceptsMouseMovedEvents = true
        window!.title = "vizualizer"
        window!.center()
        window!.isMovableByWindowBackground = true
        window!.makeKeyAndOrderFront(nil)

        graphView = Graph()
        graphView!.frame = NSRect(x:0,y:0,width:window!.frame.width,height:window!.frame.height);
        graphView!.wantsLayer = true
  //      graphView!.layer?.backgroundColor = NSColor.red.cgColor;
        window!.contentView?.addSubview(graphView!);
       
        graphView!.array = [20000,1500,36000]
        
        
        try! print(getInputDevices());
        //fft()
        audioCatcher.initialize();
        audioCatcher.start();
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.printBufs), userInfo: nil, repeats: true)
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

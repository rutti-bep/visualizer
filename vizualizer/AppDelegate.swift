//
//  AppDelegate.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/06/22.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Cocoa
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

   // var myAudioPlayer:MyAudioPlayer!
    var audioCatcher:AudioCatcher = AudioCatcher.sharedInstance;

    func printBufs(){
        print(audioCatcher.soundArray);
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        try! print(getInputDevices());
        //fft()
        audioCatcher.initialize();
        audioCatcher.start();
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.printBufs), userInfo: nil, repeats: true)
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

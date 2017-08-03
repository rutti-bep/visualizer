//
//  settingController.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/25.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
import AppKit

var garph = Graph.sharedInstance;

class SettingController:NSViewController{
    static let sharedInstance = SettingController();
    private let audioCatcher = AudioCatcher.sharedInstance;
    private let settingView = SettingView.sharedInstance;
    
    override func loadView() {
        self.view = settingView;
    }
    
    func selectedAudioDevice(){
        audioCatcher.defaultAudioDeviceId = settingView.audioLists[settingView.audioUnitSelector.title]
        DispatchQueue.main.async {
            AudioCatcher.sharedInstance.end();
            AudioCatcher.sharedInstance.initialize();
            AudioCatcher.sharedInstance.start()
        }
    }
    
    func selectedGraphMode(){
        let mode = GraphMode(rawValue: settingView.graphModeSelector.title)
        if(mode != nil){
            Graph.sharedInstance.mode = mode!
        }
    }
}

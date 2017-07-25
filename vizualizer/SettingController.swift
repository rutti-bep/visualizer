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
    
    override func loadView() {
        self.view = SettingView.sharedInstance
    }
}

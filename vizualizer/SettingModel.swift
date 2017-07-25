//
//  SettingModel.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/25.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
import AppKit

class SettingModel {
    static let sharedInstance = SettingModel()
    var heightParsent:CGFloat = 0.5;
    var soundDataSampling = 3;
    var backgroundColor = NSColor.clear;
    var lineColor:NSColor = NSColor.init(red: 0.972549019607843, green: 0.709803921568627, blue: 0.031372549019608, alpha: 1)
    
}

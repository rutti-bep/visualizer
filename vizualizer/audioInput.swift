//
//  audioInput.swift
//  vizualizer
//
//  Created by 今野暁 on 2017/07/15.
//  Copyright © 2017年 今野暁. All rights reserved.
//

import Foundation
//import AVFoundation
import Accelerate

func fft(){
    // 標本化数
    let numSamples = 128
    // サンプルデータ
    var samples:[Float] = [Float](repeating: 0, count: numSamples)
    
    for n in 0..<numSamples {
        samples[n] = 0.25 * sinf(Float(M_PI) * Float(n) / 16.0)
    }
    
    var reals = [Float](repeating: 0, count: numSamples/2)
    var imgs  = [Float](repeating: 0, count: numSamples/2)
    var splitComplex = DSPSplitComplex(realp: &reals, imagp: &imgs)
    let samplesPtr: UnsafePointer<DSPComplex> = UnsafeRawPointer(samples).bindMemory(to: DSPComplex.self, capacity: samples.count)
    vDSP_ctoz(samplesPtr, 2, &splitComplex, 1, vDSP_Length(numSamples/2))
    
    let setup = vDSP_create_fftsetup(6, FFTRadix(FFT_RADIX2));

    vDSP_fft_zrip(setup!, &splitComplex, 1, 6, FFTDirection(FFT_FORWARD))
    
    // splitComplex.realp, splitComplex.imagpの各要素を1/2倍する
    var scale:Float = 1 / 2
    vDSP_vsmul(splitComplex.realp, 1, &scale, splitComplex.realp, 1, vDSP_Length(numSamples/2))
    vDSP_vsmul(splitComplex.imagp, 1, &scale, splitComplex.imagp, 1, vDSP_Length(numSamples/2))
    // 複素数の実部と虚部を取得する
    let r = Array(UnsafeBufferPointer(start: splitComplex.realp, count: numSamples/2))
    let i = Array(UnsafeBufferPointer(start: splitComplex.imagp, count: numSamples/2))
    for n in 1..<numSamples/2 {
        let rel = r[n]
        let img = i[n]
        let mag = sqrtf(rel * rel + img * img)
        let log = "[%02d]: Mag: %5.2f, Rel: %5.2f, Img: %5.2f"
        print(String(format: log, n, mag, rel, img))
    }
    
    // setupを解放
    vDSP_destroy_fftsetup(setup);
}


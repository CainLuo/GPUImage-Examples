//
//  VideoOperationViewController.swift
//  GPUImageDemo
//
//  Created by CainLuo on 2020/8/1.
//  Copyright © 2020 CainLuo. All rights reserved.
//

import UIKit
import GPUImage

class VideoOperationViewController: UIViewController {
    
    @IBOutlet weak var renderView: RenderView!
    var camera:Camera!
    var operation:BrightnessAdjustment!

    static func configureWith() -> VideoOperationViewController {
        let vc = Storyboard.VideoOperation.instantiate(VideoOperationViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
//            operation = BasicOperation(fragmentFunctionName: "passthroughFragment")
            operation = BrightnessAdjustment()
            camera = try Camera(sessionPreset: .vga640x480)
            camera.runBenchmark = true
            camera --> operation --> renderView
            camera.startCapture()
        } catch {
            fatalError("Could not initialize rendering pipeline: \(error)")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        operation.brightness = sender.value
    }
}

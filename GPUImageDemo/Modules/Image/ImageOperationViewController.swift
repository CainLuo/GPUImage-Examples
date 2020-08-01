//
//  ImageOperationViewController.swift
//  GPUImageDemo
//
//  Created by CainLuo on 2020/8/1.
//  Copyright © 2020 CainLuo. All rights reserved.
//

import UIKit
import GPUImage

class ImageOperationViewController: UIViewController {
    
    @IBOutlet weak var renderView: RenderView!

    private var picture: PictureInput!
    private var filterOperation: BrightnessAdjustment!

    static func configureWith() -> ImageOperationViewController {
        let vc = Storyboard.CameraOperation.instantiate(ImageOperationViewController.self)
        return vc
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Filtering image for saving
        let testImage = UIImage(named:"image")!
        let toonFilter = ToonFilter()
        let filteredImage = testImage.filterWithOperation(toonFilter)
        
        let pngImage = filteredImage.pngData()!
        do {
            let documentsDir = try FileManager.default.url(for:.documentDirectory, in:.userDomainMask, appropriateFor:nil, create:true)
            let fileURL = URL(string:"test.png", relativeTo:documentsDir)!
            try pngImage.write(to:fileURL, options:.atomic)
        } catch {
            print("Couldn't write to file with error: \(error)")
        }
                
        // Filtering image for display
        picture = PictureInput(image:UIImage(named:"image")!)
        let filter = BrightnessAdjustment()
        filter.brightness = 0.7
        picture --> filter --> renderView
        picture.processImage()
    }
}

//
//  CameraOperationController.swift
//  GPUImageDemo
//
//  Created by CainLuo on 2020/8/1.
//  Copyright © 2020 CainLuo. All rights reserved.
//

import UIKit
import GPUImage
import Metal

class CameraOperationController: UIViewController {

    @IBOutlet weak var cameraView: RenderView!
    @IBOutlet weak var slider: UISlider!
    
    let videoCamera: Camera?
    var blendImage: PictureInput?
    var filterOperation: FilterOperationInterface?
    
    static func configureWith() -> CameraOperationController {
        let vc = Storyboard.CameraOperation.instantiate(CameraOperationController.self)
        return vc
    }
    
    required init?(coder: NSCoder) {
        do {
            videoCamera = try Camera(sessionPreset: .vga640x480, location: .backFacing)
            videoCamera?.runBenchmark = true
        } catch {
            videoCamera = nil
            print("Couldn't initialize camera with error: \(error)")
        }
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCameraView()
        configFliderAction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let videoCamera = videoCamera {
            videoCamera.stopCapture()
            videoCamera.removeAllTargets()
            blendImage?.removeAllTargets()
        }
        
        super.viewWillDisappear(animated)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        if let filterOperation = filterOperation {
            switch filterOperation.sliderConfiguration {
            case .enabled(_, _, _):
                filterOperation.updateBasedOnSliderValue(sender.value)
            default:
                break
            }
        }
    }
}

extension CameraOperationController {
    private func configCameraView() {
        guard let videoCamera = videoCamera else { return }
        
        if let filterOperation = filterOperation {
            switch filterOperation.filterOperationType {
            case .singleInput:
                videoCamera.addTarget(filterOperation.filter)
                filterOperation.filter.addTarget(cameraView)
            case .blend:
                videoCamera.addTarget(filterOperation.filter)
                self.blendImage = PictureInput(imageName:"image")
                self.blendImage?.addTarget(filterOperation.filter)
                self.blendImage?.processImage()
                filterOperation.filter.addTarget(cameraView)
            case let .custom(filterSetupFunction:setupFunction):
                filterOperation.configureCustomFilter(setupFunction(videoCamera, filterOperation.filter, cameraView))
            }
            
            videoCamera.startCapture()
        }
    }
    
    private func configFliderAction() {
        if let filterOperation = filterOperation {
            switch filterOperation.sliderConfiguration {
            case .disabled:
                slider.isHidden = true
            case let .enabled(minimumValue, maximumValue, initialValue):
                slider.minimumValue = minimumValue
                slider.maximumValue = maximumValue
                slider.value = initialValue
                slider.isHidden = false
            }
        }
    }
}

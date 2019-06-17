//
//  CameraViewController.swift
//  CC Scanner
//
//  Created by Barbara Vanaki on 6/12/19.
//  Copyright © 2019 Barbara Vanaki. All rights reserved.
//

import UIKit
import Vision
import AVFoundation
import AVKit

import TesseractOCR


class CameraViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        //If the person lets you use the camera, then get it ready
        if isAuthorized(){
            configureCamera()
        }
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    weak var coordinator: MainCoordinator?
    
    
    
    
    //Get your camera ready
    private var cameraView: CameraView {
        return view as! CameraView
    }
    
    
    
    
    
    
    private func configureCamera() {
        cameraView.session = session
        
        
        let cameraDevices = AVCaptureDevice.DiscoverySession(deviceTypes:
        //You only want to use the BACK of the camera. Don't scare people by defaulting to the front. That's a terrible UX.
            [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        var cameraDevice: AVCaptureDevice?
        for device in cameraDevices.devices {
            if device.position == .back {
                cameraDevice = device
                break
            }
        }
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: cameraDevice!)
            //if you were able to get a device, then hook it up
            if session.canAddInput(captureDeviceInput) {
                session.addInput(captureDeviceInput)
            }
        }
        catch {
            print("Error occured configuring the camera \(error)")
            return
        }
        session.sessionPreset = .high
        let videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput.setSampleBufferDelegate(self as? AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue(label: "Buffer Queue", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil))
        if session.canAddOutput(videoDataOutput) {
            session.addOutput(videoDataOutput)
        }
        cameraView.videoPreviewLayer.videoGravity = .resize
        session.startRunning()
    }
    
    
    
    private let session = AVCaptureSession()
    

    //Ask for permission
    private func isAuthorized() -> Bool {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authorizationStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video,
                                          completionHandler: { (granted:Bool) -> Void in
                                            if granted {
                                                DispatchQueue.main.async {
                                                    print("granted")
                                                    self.configureCamera()
                                                }
                                            }
            })
            return true
        case .authorized:
            return true
        case .denied, .restricted: return false
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//remember that stuff in the extension isn't tested by unit tests, so try not to put too many important bits in here


//
//  ViewController.swift
//  Euroday
//
//  Created by Ņikita Roldugins on 26/02/2022.
//

import AVFoundation
import UIKit


class ViewController: UIViewController {
    
    var session: AVCaptureSession?
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    private let shutterButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        button.layer.cornerRadius = 37.5
        button.layer.borderWidth = 6
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.layer.addSublayer(previewLayer)
        view.addSubview(shutterButton)
        checkCameraPermission()
        
        shutterButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
        
        shutterButton.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height - 130)
    }
    
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { return }
                DispatchQueue.main.async { self?.setUpCamera() }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        @unknown default:
            break
        }
    }
    
    
    private func setUpCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                
                session.startRunning()
                self.session = session
            }
            catch { print(error) }
        }
    }
    
    
    @objc private func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        
        let vc = DetailViewController()
        DispatchQueue.main.async { self.present(vc, animated: true) }
    }
}


extension ViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        let image = UIImage(data: data)
        
        session?.stopRunning()
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
}

//
//  CameraView.swift
//  CameraTest
//
//  Created by Rakan on 2023/8/10.
//

//import SwiftUI
//import AVFoundation
//
//struct CameraView: UIViewRepresentable {
//    typealias UIViewType = PreviewView
//    
//    func makeUIView(context: Context) -> PreviewView {
//        let view = PreviewView.shared
//        view.startCaptureSession()
//        return view
//    }
//    
//    func updateUIView(_ uiView: PreviewView, context: Context) {
//        
//    }
//}
//
//
//
//class PreviewView: UIView {
//    static let shared = PreviewView()
//    private var captureSession: AVCaptureSession?
//    private var videoOutput: AVCaptureVideoDataOutput?
//    private var currentFrame: UIImage?
//    
//    override class var layerClass: AnyClass {
//        return AVCaptureVideoPreviewLayer.self
//    }
//    
//    override var layer: AVCaptureVideoPreviewLayer {
//        return super.layer as! AVCaptureVideoPreviewLayer
//    }
//    
//    func startCaptureSession() {
//        captureSession = AVCaptureSession()
//        layer.session = captureSession
//        layer.videoGravity = .resizeAspectFill
//        
//        let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
//        guard let device = captureDevice else { return }
//        let deviceInput = try! AVCaptureDeviceInput(device: device)
//        
//        if captureSession!.canAddInput(deviceInput) {
//            captureSession!.addInput(deviceInput)
//        }
//        
//        videoOutput = AVCaptureVideoDataOutput()
//        videoOutput?.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
//        captureSession?.addOutput(videoOutput!)
//        
//        captureSession!.startRunning()
//    }
//    
//    func captureCurrentFrame(completion: @escaping (UIImage) -> Void) {
//        guard let currentFrame = currentFrame else {
//            completion(UIImage())  // 返回空图片或适当的占位符
//            return
//        }
//        completion(currentFrame)
//    }
//}
//
//extension PreviewView: AVCaptureVideoDataOutputSampleBufferDelegate {
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
//        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
//        let context = CIContext()
//        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
//        currentFrame = UIImage(cgImage: cgImage)
//    }
//}
//
//#Preview {
//    CameraView()
//}



//class PreviewView: UIView {
//    private var captureSession: AVCaptureSession?
//
//    override class var layerClass: AnyClass {
//        return AVCaptureVideoPreviewLayer.self
//    }
//
//    override var layer: AVCaptureVideoPreviewLayer {
//        return super.layer as! AVCaptureVideoPreviewLayer
//    }
//
//    func startCaptureSession() {
//        captureSession = AVCaptureSession()
//        layer.session = captureSession
//        layer.videoGravity = .resizeAspectFill
//
//        let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
//        guard let device = captureDevice else { return }
//        let deviceInput = try! AVCaptureDeviceInput(device: device)
//
//        if captureSession!.canAddInput(deviceInput) {
//            captureSession!.addInput(deviceInput)
//        }
//        captureSession!.startRunning()
//    }
//}

////
////  GestureRecognitionService.swift .swift
////  CameraTest
////
////  Created by Rakan on 2023/8/11.
////
//import Foundation
//import UIKit
//
//class GestureRecognitionService {
//    private var previewView: PreviewView.shared
//    
//    // 从视频流中每隔0.5秒捕获一个帧作为图片
//    func startGestureRecognition(accessToken: String, completion: @escaping (String) -> Void) {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            self.captureFrame { image in
//                let base64String = self.convertImageToBase64(image: image)
//                self.callGestureRecognitionAPI(base64Image: base64String, accessToken: accessToken, completion: completion)
//            }
//        }
//    }
//    
//    // 捕获视频流的帧并返回为 UIImage
//    // 这是一个占位符，您需要用实际的代码来捕获视频流的帧
//    func captureFrame(completion: @escaping (UIImage) -> Void) {
//        previewView.captureCurrentFrame(completion: completion)
//    }
//    
//    // 将 UIImage 转换为 BASE64 字符串
//    func convertImageToBase64(image: UIImage) -> String {
//        let imageData = image.pngData()!
//        return imageData.base64EncodedString()
//    }
//    
//    // 调用手势识别 API
//    func callGestureRecognitionAPI(base64Image: String, accessToken: String, completion: @escaping (String) -> Void) {
//        let url = URL(string: "https://aip.baidubce.com/rest/2.0/image-classify/v1/gesture?access_token=\(accessToken)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        let bodyData = "image=\(base64Image)"
//        request.httpBody = bodyData.data(using: .utf8)
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard error == nil, let data = data else { return }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//               let results = json["result"] as? [[String: Any]],
//               let firstResult = results.first,
//               let className = firstResult["classname"] as? String {
//                completion(className)
//            }
//        }
//        
//        task.resume()
//    }
//}

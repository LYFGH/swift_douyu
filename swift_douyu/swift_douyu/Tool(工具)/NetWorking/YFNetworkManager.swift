//
//  YFNetworkManager.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit
import Alamofire
import Reachability

class YFNetworkManager: NSObject {
    
    static public let shared: YFNetworkManager = {
        let instance: YFNetworkManager = YFNetworkManager()
        return instance
    }()
    
    
    public typealias suceessHandler = (_ json: [String: Any]?) -> Void
    public typealias failHandler = (_ error: Error?) -> Void

    public var reachability: Reachability = Reachability()! // 用来监测网络环境
    
    
    public func getRequest(url:String, params: [String : Any]?, suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil) -> Request {
           
           let headers = self.loadAfterHandle(url: url, params: params, suceessHandler: suceessHandler, failHandler: failHandler);

           let request =
               Alamofire.request(URL(string: url)!, method: HTTPMethod.get, parameters: params, encoding:  URLEncoding.default, headers: headers).responseJSON { response in
                   self.completion(suceessHandler: suceessHandler, failHandler: failHandler, response: response)
           }
           
           return request
           
       }
    
        public func postRequest(url:String, params: [String : Any]?, suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil) -> Request {
            
            let headers = self.loadAfterHandle(url: url, params: params, suceessHandler: suceessHandler, failHandler: failHandler)
            
            let request =
                Alamofire.request(URL(string: url)!, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
                    self.completion(suceessHandler: suceessHandler, failHandler: failHandler, response: response)
            }
            
            return request
            
        }
    
        // MARK: - 上传
            /// 上传
            public func uploadRequestBeginning(valueParams: [String: Any], dataParams: [String: Data?]?, requestURL: String, suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil) {

                var header = self.loadAfterHandle(url: requestURL, params: valueParams, suceessHandler: suceessHandler, failHandler: failHandler);
                header?.updateValue("multipart/form-data", forKey: "content-type")

                Alamofire.upload(multipartFormData: { (multipartFormData) in
                    // 上传字符串等
                    for (key, value) in valueParams {
                        if let string = value as? String,
                            let data = string.data(using: .utf8) {
                            multipartFormData.append(data, withName: key)
                        }
                    }
                    // 上传data
                    if let datas = dataParams {
                        for (key, value) in datas {
                            if let data = value {
                                multipartFormData.append(data, withName: key, fileName: "image_\(key).jpg", mimeType: "image/jpeg")
                            }
                        }
                    }

                }, to: requestURL, headers: header ) { (encodingResult) in
                    switch encodingResult {
                        case .success(request: let uploadRequest, streamingFromDisk: _, streamFileURL: _):
                            uploadRequest.responseJSON(completionHandler: { (uploadResponse) in
                                guard uploadResponse.result.isSuccess else {
                                    if failHandler != nil {
                                        failHandler!(uploadResponse.result.error)
                                    }
                                    return
                                }

                                guard uploadResponse.result.value != nil else {
                                    if failHandler != nil {
                                        failHandler!(uploadResponse.result.error)
                                    }
                                    return
                                }

                                let json = uploadResponse.result.value as! Dictionary<String, Any>

                                if suceessHandler != nil {
                                    suceessHandler!(json)
                                }
                            })
                            break
                        case .failure(let error):
                            failHandler!(error)
                            break
                    }
                }


        //        let requestData = Alamofire.upload(data, to: requestURL).uploadProgress { (progress) in
        //            // 进度
        //            }.responseJSON { (response) in
        //                self.completion(suceessHandler: suceessHandler, failHandler: failHandler, response: response)
        //        }
        //        return requestData
            }
            
            // MARK: - 下载
            /// 下载
            public func downloadRequestBeginning(requestURL: String, filePath: URL, suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil) -> DownloadRequest {
                // 下载到...Path
                let destination: DownloadRequest.DownloadFileDestination = { _, _ in
                    print(filePath.absoluteString)
                    return (filePath, [.createIntermediateDirectories, .removePreviousFile])
                }
                
                let downloadRequest = Alamofire.download(requestURL, to: destination).downloadProgress { (progress) in
                    // 进度
                    print(progress)
                    }.responseJSON { (downloadResponse) in
                        
                        guard downloadResponse.result.isSuccess else {
                            if failHandler != nil {
                                failHandler!(downloadResponse.result.error)
                            }
                            return
                        }
                        
                        guard downloadResponse.result.value != nil else {
                            if failHandler != nil {
                                failHandler!(downloadResponse.result.error)
                            }
                            return
                        }
                        
                        let json = downloadResponse.result.value as! Dictionary<String, Any>
                        
                        if suceessHandler != nil {
                            suceessHandler!(json)
                        }
                        
                }
                return downloadRequest
            }
            
    
        /// 处理数据结果
        ///
        /// - Parameters:
        ///   - suceessHandler: 成功数据处理
        ///   - failHandler: 失败数据处理
        ///   - response: response
        private func completion(suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil, response: DataResponse<Any>) -> Void {

            guard response.result.isSuccess else {
                if failHandler != nil {
                    failHandler!(response.result.error)
                }
                return
            }
            
            guard response.result.value != nil else {
                if failHandler != nil {
                    failHandler!(response.result.error)
                }
                return
            }
            
            let json = response.result.value as! Dictionary<String, Any>
            
            if suceessHandler != nil {
                suceessHandler!(json)
            }
            
        }
        
        
        // Mark: 请求前处理
        private func loadAfterHandle(url:String, params: [String : Any]?, suceessHandler: suceessHandler? = nil, failHandler: failHandler? = nil) -> [String: String]? {
            
            if url.isEmpty || !url.contains("http") {
                // 地址有问题
                if suceessHandler != nil {
                    suceessHandler!(nil)
                }
                
                if failHandler != nil {
                    failHandler!(nil)
                }
                
                return nil;
            }
            
            var headers: [String: String]?
            
            if params != nil {
                headers = headerParams(parameters: params!)
            }

            return headers;
        }
        
        
        // Mark: 字典转换成“key=value”格式后，按升序排序，并添加到数组中
        private func riseSort(allParams: [String: Any]) -> [String] {
            var array: [String] = []
            for (key, value) in allParams {
                let string = "\(key)=\(value)"
                array.append(string)
            }
            return array
        }
        
        
        // Mark: 创建头部值
        private func headerParams(parameters: [String : Any]) -> [String : String] {
//            let array = riseSort(allParams: parameters)
//            let _nsign = "default"
//            let _nversion = "default"
//            return ["_nsign": _nsign, "_nversion": _nversion]
            return [:]
        }
    
}

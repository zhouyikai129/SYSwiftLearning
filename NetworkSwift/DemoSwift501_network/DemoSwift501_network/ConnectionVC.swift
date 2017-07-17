//
//  ConnectionVC.swift
//  DemoSwift501_network
//
//  Created by zhangshaoyu on 2017/7/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ConnectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "网络请求"
        
        self.array = ["get无参数", "get有参数", "post无参数", "post有参数"]
        
        
        let table = UITableView(frame: self.view.bounds, style: .Plain)
        self.view.addSubview(table)
        table.tableFooterView = UIView()
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        table.delegate = self
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        
        let text:String = self.array[indexPath.row] as! String
        cell!.textLabel!.text = text
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let text:String = self.array[indexPath.row] as! String
        if text == "get无参数"
        {
            self.requestWithGet()
        }
        else if text == "get有参数"
        {
            self.requestWithGetParams()
        }
        else if text == "post无参数"
        {
            self.requestWithPost()
        }
        else if text == "post有参数"
        {
            self.requestWithPostParams()
        }
    }
    
    // MARK: - get
    
    func requestWithGet()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginGet")!
        // 请求(可以改的请求)
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        // 默认就是GET请求
        request.HTTPMethod = "GET"
        // 发起请求
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue()) {
                (response, data, error)in
            
            print(response)
            print(data)
            print(error)
            
            do {
//                let result = NSString(data: data!, encoding:NSUTF8StringEncoding)
                
                let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                print(result)
            } catch {
                
            }
        }
    }
    
    func requestWithGetParams()
    {
        // NSURL
//        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginGetWithParams?userName='devZhang'&userPassword='devZhang'")!
//        // NSURLRequest
//        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
//        request.HTTPMethod = "GET"
//        // 请求的Header
//        request.addValue("a566eb03378211f7dc9ff15ca78c2d93", forHTTPHeaderField: "apikey")
//        // NSURLSession
//        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let session:NSURLSession = NSURLSession(configuration: configuration)
//        
//        // NSURLSessionTask
//        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
//            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
//            if error == nil
//            {
//                do {
//                    let responseData:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//                    print(responseData)
//                } catch {
//                    
//                }
//            }
//        })
//        // 启动任务
//        task.resume()
    }
    
    // MARK: - post
    
    func requestWithPost()
    {
        // NSURL
//        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginPost")!
//        // NSURLRequest
//        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
//        request.HTTPMethod = "POST"
//        let postString = ""
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
//        // NSURLSession
//        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let session:NSURLSession = NSURLSession(configuration: configuration)
//        
//        // NSURLSessionTask
//        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
//            (data:NSData?,response:NSURLResponse?, error:NSError?) -> Void in
//            if error == nil
//            {
//                do {
//                    let responseData:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//                    print(responseData)
//                } catch {
//                    
//                }
//            }
//        })
//        // 启动任务
//        task.resume()
    }
    
    func requestWithPostParams()
    {
        // NSURL
        let url:NSURL = NSURL(string:"http://rapapi.org/mockjsdata/22598/userloginPostWithParams")!
        // 请求(可以改的请求)
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        // POST请求
        request.HTTPMethod = "POST"
        // 数据体
        let params:NSMutableDictionary = NSMutableDictionary()
        params["userName"] = "devZhang"
        params["userPassword"] = "devZhang"
        var jsonData:NSData? = nil
        do {
            jsonData  = try NSJSONSerialization.dataWithJSONObject(params, options:NSJSONWritingOptions.PrettyPrinted)
        } catch {
            
        }
        // 将字符串转换成数据
        request.HTTPBody = jsonData
        // 发起请求
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue()) {
            (response, data, error)in
            
            print(response)
            print(data)
            print(error)
            
            do {
//                let result = NSString(data: data!, encoding:NSUTF8StringEncoding)
                
                let result:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                print(result)
            } catch {
                
            }

        }
    }


}
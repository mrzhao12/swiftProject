//
//  WKWebVC.swift
//  MySwift
//
//  Created by zhaotong on 2023/3/1.
//  Copyright © 2023 yinhe. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import WebViewJavascriptBridge
class WKWebVC: BaseViewController {
    var tturl : String!
    var webBridge:WKWebViewJavascriptBridge!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        title = "网页"
//        self.navigationItem.title = "网页"
        view.backgroundColor = .lightGray
        self.view .addSubview(self.webView)
        self.webBridge = WKWebViewJavascriptBridge.init(for: self.webView)
        self.webBridge.setWebViewDelegate(self)
        registFunction()
    }
    
    func setStatusBarBackgroundColor(color : UIColor){
        let barview = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(SCREENWIDTH), height: STatusHeight))
        barview.backgroundColor = color
        view.addSubview(barview)
    }
    
    func registFunction()  {
        self.webBridge.registerHandler("mapLocation"){ (data, callBack) in
            let param:[String:Any] = data as! Dictionary
            print(param)
            
            
        }
    }
    
    lazy var webView:WKWebView = {

        let webView = WKWebView(frame: CGRect(x: 0, y: CGFloat(NaviHeight), width: SCREENWIDTH, height: SCREENHEIGHT-CGFloat(NaviHeight)));
        let url = NSURL(string: tturl)
        let request =  NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)

        return webView
    }()


    
}

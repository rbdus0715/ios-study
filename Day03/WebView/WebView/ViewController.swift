//
//  ViewController.swift
//  WebView
//
//  Created by gyuyeon jo on 9/3/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var textUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 로딩중인지 확인하기 위해
        myWebView.navigationDelegate = self
        loadWebPage("https://www.naver.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 로딩중일 때는 화면에 인디케이터가 보이도록
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 로딩이 끝났을 때
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        // 에러 발생 시
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        if !flag {
            strUrl = "https://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(textUrl.text!)
        textUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("https://m.blog.naver.com/rbdus0715")
    }
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("https://github.com/rbdus0715")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        // 이렇게 줄바꿈 없이 입력해야함
        let htmlString = "<h1> HTML String</h1><p>String 변수를 이용한 웹페이지</p><p><a href=\"https://www.google.com\">google로 이동 </a></p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}


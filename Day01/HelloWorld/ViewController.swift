//
//  ViewController.swift
//  HelloWorld
//
//  Created by gyuyeon jo on 9/1/25.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false // 확대 여부
    var imgOn: UIImage? // 켜진 전구 이미지가 있는 이미지 타입 변수
    var imgOff: UIImage? // 꺼진 전구 이미지 ... 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "light_on.png")
        imgOff = UIImage(named: "light_off.png")
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        }
        else {
            imgView.image = imgOff
        }
    }
}


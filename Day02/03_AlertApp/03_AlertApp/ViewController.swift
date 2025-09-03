//
//  ViewController.swift
//  03_AlertApp
//
//  Created by gyuyeon jo on 9/3/25.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "light_on")
    let imgOff = UIImage(named: "light_off")
    let imgRemove = UIImage(named: "light_remove")
    var isLightOn = true

    @IBOutlet var lightImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightImage.image = imgOn
    }

    @IBAction func btnLightOn(_ sender: Any) {
        if(isLightOn) {
            // 이미 전구가 켜져있는데 또 "켜기" 버튼을 눌렀을 때 Alert 발생
            let lightOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lightOnAlert.addAction(onAction)
            present(lightOnAlert, animated: true, completion: nil)
        } else {
            lightImage.image = imgOn
            isLightOn = true
        }
    }
    @IBAction func btnLightOff(_ sender: Any) {
        if isLightOn {
            let lightOffAlert = UIAlertController(title: "램프 끄기", message: "전구를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lightImage.image = self.imgOff
                self.isLightOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lightOffAlert.addAction(offAction)
            lightOffAlert.addAction(cancelAction)
            present(lightOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLightRemove(_ sender: Any) {
        let lightRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lightImage.image = self.imgOff
            self.isLightOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lightImage.image = self.imgOn
            self.isLightOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lightImage.image = self.imgRemove
            self.isLightOn = false
        })
        
        lightRemoveAlert.addAction(offAction)
        lightRemoveAlert.addAction(onAction)
        lightRemoveAlert.addAction(removeAction)
        present(lightRemoveAlert, animated: true, completion: nil)
    }
    
}


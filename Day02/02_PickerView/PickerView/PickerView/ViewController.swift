//
//  ViewController.swift
//  PickerView
//
//  Created by gyuyeon jo on 9/3/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 4
    let PICKER_VIEW_COLUMN = 1
    let PCCKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [
        "img_01.png",
        "img_02.png",
        "img_03.png",
        "img_04.png",
    ]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var labelImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        labelImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // 피커뷰에게 컴포넌트 수를 정수 값으로 넘겨주는 델리게이트 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }

    // numberOfRowsInComponent 인수를 갖는 델리게이트 메서드, 피커뷰에게 열의 개수를 정수 값으로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PCCKER_VIEW_HEIGHT
    }
    
    // titleForRow 인수로 갖는 델리게이트 메서드, 각 열의 타이틀을 문자열 값을 넘겨줌
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        // 이미지 뷰 리턴하기
        return imageView
    }
        
    // 선택된 열의 파일 이름을 레이블에 표시하기 (didSelectRow)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}


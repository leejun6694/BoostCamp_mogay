//
//  ViewController.swift
//  Week3Quiz
//
//  Created by JUN LEE on 2017. 7. 19..
//  Copyright © 2017년 LEEJUN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: Properties
    
    var memberIndexs: [String] = []     // 연락처 이름의 첫번째 알파벳 배열
    
    // 연락처 이름이 members에 저장됨
    var members: [String] = [] {
        didSet {
            for member in members {
                
                // 연락처 이름의 첫번째 알파벳을 중복되지 않게 memberIndexs 배열에 넣어줘야 합니다
                
            }
        }
    }
    
    // MARK: override

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 번들 내에 있는 연락처 정보를 가져옴
        guard let url = Bundle.main.url(forResource: "MemberList", withExtension: "rtf") else { return }
        let attString = try? NSAttributedString(url: url, options: [:], documentAttributes: nil)
        guard let names = attString?.string.components(separatedBy: "\n") else { return }
        self.members = names
        
    }

    // 연락처 이름을 각 셀에 저장합니다
    // 연락처 이름의 첫번째 알파벳들을 섹션으로 나눠줘야 합니다


}


//
//  BadgePageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/31.
//

import UIKit
import YDS_iOS
import SnapKit

class BadgePageViewController: StoryBookViewController {
        
    let sampleBadge: YDSBadge = {
        let badge = YDSBadge()
        return badge
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addOptions()
    }
    
    private func setupView() {
        setViewProperty()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperty() {
        self.title = "Badge"
        
        //  mono 컬러의 badge가 배경이랑 색이 겹쳐서
        //  이 페이지는 임의로 하얀 컬러로 설정했습니다.
        sampleView.backgroundColor = YDSColor.bgNormal
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleBadge)
        
    }
    
    private func setAutolayout() {
        sampleBadge.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "광고") {
            self.sampleBadge.text = $0
        }
        
        addOption(description: "icon",
                  images: ydsIconArray,
                  defaultImage: YDSIcon.adbadgeFilled) {
            self.sampleBadge.icon = $0
        }
        
        addOption(description: "color",
                  cases: YDSItemColor.allCases,
                  defaultIndex: 3) {
            self.sampleBadge.color = $0
        }
        
    }

}

extension YDSItemColor: CaseIterable {
    public static var allCases: [YDSItemColor] = [.mono, .green, .emerald, .aqua, .blue, .indigo, .violet, .purple, .pink]
}

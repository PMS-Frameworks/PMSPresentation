//
//  ArrarngeSubviews.swift
//  PMS-iOS-V2
//
//  Created by GoEun Jeong on 2021/05/20.
//

#if os(iOS)

import UIKit

public extension UIStackView {
    func addArrangeSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

public extension UIView {
    func addSubViews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

#endif

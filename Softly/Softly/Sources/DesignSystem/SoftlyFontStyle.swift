//
//  SoftlyFontStyle.swift
//  Softly
//
//  Created by 노가현 on 3/12/24.
//

import SwiftUI

protocol SoftlyFontable {
    var size: CGFloat { get }
    var weight: SoftlyFontWeight { get }
}

public enum SoftlyFontWeight: String {
    case bold = "Bold"
    case regular = "Regular"
}

public enum SoftlyFontStyle: CGFloat, Hashable, SoftlyFontable {
    case h1
    case h2
    case h3
    case h4
    case h5
    case p1
    case p2
    case p3
    case caption

    var size: CGFloat {
        switch self {
        case .h1:
            return 48
        case .h2:
            return 32
        case .h3:
            return 20
        case .h4:
            return 16
        case .h5:
            return 14
        case .p1:
            return 16
        case .p2:
            return 14
        case .p3:
            return 12
        case .caption:
            return 12
        }
    }
}

// MARK: - FontableSize
extension SoftlyFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Button
public extension SoftlyFontStyle {
    var weight: SoftlyFontWeight {
        switch self {
        case .h1, .h2, .h3, .h4, .h5:
            return .bold
        case .p1, .p2, .p3, .caption:
            return .regular
        }
    }
}

//
//  SoftlyFont.swift
//  Softly
//
//  Created by 노가현 on 3/12/24.
//

import SwiftUI

public struct SoftlyFont: ViewModifier {
    public var style: SoftlyFontStyle

    public func body(content: Content) -> some View {
        return content.font(.custom("SpoqaHanSansNeo-\(style.weight.rawValue)", size: style.size))
    }
}

public extension View {
    func SoftlyFont(_ style: SoftlyFontStyle) -> some View {
        self
            .modifier(Softly.SoftlyFont(style: style))
    }

    func SoftlyFont(_ style: SoftlyFontStyle, color: Color) -> some View {
        self
            .SoftlyFont(style)
            .foregroundColor(color)
    }
}

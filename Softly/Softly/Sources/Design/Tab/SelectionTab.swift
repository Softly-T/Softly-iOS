import SwiftUI

struct SelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<TabFlow> = .constant(.homeimg)
}

public extension EnvironmentValues {
    var selectionTabbKey: Binding<TabFlow> {
        get { self[SelectionTabbKey.self] }
        set { self[SelectionTabbKey.self] = newValue }
    }
}

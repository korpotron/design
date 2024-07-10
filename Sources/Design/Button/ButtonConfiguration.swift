import SwiftUI

struct ButtonDesign {
    struct Style {
        let background: Color
        let border: Color
        let foreground: Color
    }

    struct State {
        let normal: Style
        let pressed: Style
        let disabled: Style

        func style(isEnabled: Bool, isPressed: Bool) -> Style {
            if !isEnabled {
                return disabled
            } else if isPressed {
                return pressed
            } else {
                return normal
            }
        }
    }
}

private protocol ButtonAssetsStyle {
    static var background: ColorResource { get }
    static var border: ColorResource { get }
    static var foreground: ColorResource { get }
}

private extension ButtonDesign.Style {
    static func of(_ assets: ButtonAssetsStyle.Type) -> Self {
        .init(
            background: Color(assets.background),
            border: Color(assets.border),
            foreground: Color(assets.foreground)
        )
    }
}

extension ColorResource.Button.Primary.Normal: ButtonAssetsStyle {}
extension ColorResource.Button.Primary.Pressed: ButtonAssetsStyle {}
extension ColorResource.Button.Primary.Disabled: ButtonAssetsStyle {}

extension ButtonDesign.State {
    static let primary = ButtonDesign.State(
        normal: .of(ColorResource.Button.Primary.Normal.self),
        pressed: .of(ColorResource.Button.Primary.Pressed.self),
        disabled: .of(ColorResource.Button.Primary.Disabled.self)
    )
}

extension ColorResource.Button.Secondary.Normal: ButtonAssetsStyle {}
extension ColorResource.Button.Secondary.Pressed: ButtonAssetsStyle {}
extension ColorResource.Button.Secondary.Disabled: ButtonAssetsStyle {}

extension ButtonDesign.State {
    static let secondary = ButtonDesign.State(
        normal: .of(ColorResource.Button.Secondary.Normal.self),
        pressed: .of(ColorResource.Button.Secondary.Pressed.self),
        disabled: .of(ColorResource.Button.Secondary.Disabled.self)
    )
}

extension ColorResource.Button.Danger.Normal: ButtonAssetsStyle {}
extension ColorResource.Button.Danger.Pressed: ButtonAssetsStyle {}
extension ColorResource.Button.Danger.Disabled: ButtonAssetsStyle {}

extension ButtonDesign.State {
    static let danger = ButtonDesign.State(
        normal: .of(ColorResource.Button.Danger.Normal.self),
        pressed: .of(ColorResource.Button.Danger.Pressed.self),
        disabled: .of(ColorResource.Button.Danger.Disabled.self)
    )
}

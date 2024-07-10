import SwiftUI

public struct GenericButtonStyle: ButtonStyle {
    let design: ButtonDesign.State

    @Environment(\.isEnabled)
    private var isEnabled: Bool

    public func makeBody(configuration: Configuration) -> some View {
        let style = design.style(isEnabled: isEnabled, isPressed: configuration.isPressed)

        return configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .foregroundStyle(style.foreground)
            .background {
                style.background
            }
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style.border, lineWidth: 2)
                    .padding(1)
            }
    }
}

public extension ButtonStyle where Self == GenericButtonStyle {
    static var primary: Self {
        .init(design: .primary)
    }

    static var secondary: Self {
        .init(design: .secondary)
    }

    static var danger: Self {
        .init(design: .danger)
    }
}

#Preview {
    VStack {
        VStack {
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.primary)
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.secondary)
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.danger)
        }
        VStack {
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.primary)
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.secondary)
            Button("Lorem Ipsum", action: {})
                .buttonStyle(.danger)
        }
        .disabled(true)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        Color(.Basis.background)
    }
    .ignoresSafeArea()
}

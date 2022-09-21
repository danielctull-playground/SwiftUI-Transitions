
import SwiftUI

extension View {

    func transition(_ transition: Transition) -> some View {
        self.transition(transition.transition)
    }
}

struct Transition: Identifiable {
    var id: String { name }
    let name: String
    let transition: AnyTransition
}


extension Transition: Equatable {
    static func == (lhs: Transition, rhs: Transition) -> Bool {
        lhs.name == rhs.name
    }
}

extension Transition: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension Transition {

    static let opacity = Self(
        name: "opacity",
        transition: .opacity)

    static let moveBottom = Self(
        name: "move(edge: .bottom)",
        transition: .move(edge: .bottom))

    static let moveTop = Self(
        name: "move(edge: .top)",
        transition: .move(edge: .bottom))

    static let moveLeading = Self(
        name: "move(edge: .leading)",
        transition: .move(edge: .leading))

    static let moveTrailing = Self(
        name: "move(edge: .trailing)",
        transition: .move(edge: .trailing))

    static let slide = Self(
        name: "slide",
        transition: .slide)

    static let pushBottom = Self(
        name: "push(from: .bottom)",
        transition: .push(from: .bottom))

    static let pushTop = Self(
        name: "push(from: .top)",
        transition: .push(from: .top))

    static let pushLeading = Self(
        name: "push(from: .leading)",
        transition: .push(from: .leading))

    static let pushTrailing = Self(
        name: "push(from: .trailing)",
        transition: .push(from: .trailing))
}

extension Transition: CaseIterable {

    static var allCases: [Transition] {
        [.opacity, .moveTop, .moveBottom, .moveLeading, .moveTrailing, .slide, .pushTop, .pushBottom, .pushLeading, .pushTrailing]
    }
}

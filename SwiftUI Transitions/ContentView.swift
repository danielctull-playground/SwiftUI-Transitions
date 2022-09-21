
import SwiftUI

struct ContentView: View {

    @State private var duration = Double(0.3)
    @State private var value = 10000
    @State private var transition = Transition.opacity
    private var formattedDuration: String { duration.formatted(.number.precision(.fractionLength(1))) }

    var body: some View {
        VStack {

            Spacer()

            HStack {
                VStack {
                    Text("contentTransition\n(    .numericText(\n        countsDown: true))")
                    Text(value.description)
                        .contentTransition(.numericText(countsDown: true))
                        .padding(20)
                        .border(Color.orange, width: 1)
                }

                Spacer()

                VStack {
                    Text("contentTransition(\n    .numericText(\n        countsDown: false))")
                    Text(value.description)
                        .contentTransition(.numericText(countsDown: false))
                        .padding(20)
                        .border(Color.orange, width: 1)
                }
            }

            Spacer()

            Image(systemName: "globe")
                .id("Text-\(value)")
                .imageScale(.large)
                .padding(20)
                .border(Color.orange, width: 1)
                .transition(transition)

            Spacer()

            Text("Hello, world!")
                .id("Text-\(value)")
                .padding(20)
                .border(Color.orange, width: 1)
                .transition(transition)

            Spacer()

            Stepper("Duration: \(formattedDuration)", value: $duration, in: 0...5, step: 0.1)

            HStack {
                Picker("Transition", selection: $transition) {
                    ForEach(Transition.allCases) { transition in
                        Text(transition.name).tag(transition)
                    }
                }

                Spacer()

                Button("Transition") {
                    withAnimation(.linear(duration: duration)) {
                        value += 1
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

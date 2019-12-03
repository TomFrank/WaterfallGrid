//
//  Copyright © 2019 Paolo Leonardi. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct ContentView: View {
    @State private var cards: [Card] = Generator.Cards.random()
    @State private var settings: Settings = Settings.default(for: .cards)
    
    var body: some View {
        WaterfallGrid((0..<cards.count), id: \.self, contentBefore: {
            VStack {
                Text("Abc")
                Text("Abc")
                Text("Abc")
            }
        }, content: { index in
            CardView(card: self.cards[index])
        })
        .gridStyle(
            columnsInPortrait: Int(settings.columnsInPortrait),
            columnsInLandscape: Int(settings.columnsInLandscape),
            spacing: CGFloat(settings.spacing),
            padding: settings.padding,
            animation: settings.animation
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

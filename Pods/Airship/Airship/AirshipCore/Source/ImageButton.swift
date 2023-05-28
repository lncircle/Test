/* Copyright Airship and Contributors */

import Foundation
import SwiftUI
import Combine

/// Image Button view.
@available(iOS 13.0.0, tvOS 13.0, *)
struct ImageButton : View {
 
    /// Image Button model.
    let model: ImageButtonModel
  
    /// View constriants.
    let constraints: ViewConstraints
  
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutState) var layoutState

    @ViewBuilder
    var body: some View {
        AirshipButton(
            identifier: self.model.identifier,
            description: self.model.contentDescription ?? self.model.identifier,
            clickBehaviors: self.model.clickBehaviors,
            actions: self.model.actions
        ) {
            makeInnerButton()
                .constraints(constraints, fixedSize: true)
                .background(self.model.backgroundColor)
                .border(self.model.border)
                .accessible(self.model)
        }
        .common(self.model)
        .environment(
            \.layoutState,
             layoutState.override(buttonState: ButtonState(identifier: self.model.identifier))
        )
    }
    
    @ViewBuilder
    private func makeInnerButton() -> some View {
        switch(model.image) {
        case .url(let model):
            AirshipAsyncImage(url: model.url) { image, _ in
                image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                AirshipProgressView()
            }
        case .icon(let model):
            Icons.icon(model: model, colorScheme: colorScheme)
        }
    }
}

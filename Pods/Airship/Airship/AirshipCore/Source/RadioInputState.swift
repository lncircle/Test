/* Copyright Airship and Contributors */

import Foundation

@available(iOS 13.0.0, tvOS 13.0, *)
class RadioInputState: ObservableObject {
    @Published
    var selectedItem: String?
    var attributeValue: AttributeValue?
    
    func updateSelectedItem(_ model: RadioInputModel?) {
        self.attributeValue = model?.attributeValue
        self.selectedItem = model?.value
    }
}

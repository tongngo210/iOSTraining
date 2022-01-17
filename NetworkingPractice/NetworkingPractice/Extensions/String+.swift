import Foundation

extension String {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}

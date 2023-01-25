// The MIT License (MIT)
// Copyright © 2022 Egor Badmaev
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum EmojiPicker {
    /// Presents emoji picker
    /// - Parameters
    ///  - vc: Parent view controller
    ///  - configuration: configuration for emoji picker, defined in Models/ directory
    ///  - selectionHandler: Emoji selection action
    public static func present(
        on parentVC: UIViewController,
        with configuration: Configuration,
        selectionHandler: @escaping (String) -> Void
    ) {
        /// Source view controller must conform `EmojiPickerDelegate` protocol, otherwise do nothing
        let viewController = EmojiPickerViewController()
        viewController.onSelection = selectionHandler
        viewController.sourceView = configuration.sender
        viewController.selectedEmojiCategoryTintColor = configuration.selectedEmojiCategoryTintColor
        viewController.arrowDirection = configuration.arrowDirection
        viewController.horizontalInset = configuration.horizontalInset
        viewController.isDismissAfterChoosing = configuration.isDismissAfterChoosing
        parentVC.present(viewController, animated: true)
    }
}

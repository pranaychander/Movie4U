//
//  UIFont.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 13/03/22.
//

import UIKit

enum FontType: String {
    case headline1
    case headline2
    case headline3
    case body1
    case body1Bold
    case body2
    case body2Bold
    case body3
    case body3Bold
}

enum FontStyle: String {
    case regular = "ProximaNova-Regular"
    case bold = "ProximaNova-Bold"
}

enum FontSize: CGFloat {
    case headline1 = 42
    case headline2 = 36
    case headline3 = 28
    case body1 = 18
    case body2 = 16
    case body3 = 14
}

enum FontLineHeight: CGFloat {
    case headline1 = 60
    case headline2 = 48
    case headline3 = 32
    case body1 = 20
    case body2 = 18
    case body3 = 16
}

extension UIFont {
    class func getFont(_ type: FontType) -> UIFont {
        switch type {
        case .headline1:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.headline1.rawValue)!
        case .headline2:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.headline2.rawValue)!
        case .headline3:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.headline3.rawValue)!
        case .body1:
            return UIFont(name: FontStyle.regular.rawValue, size: FontSize.body1.rawValue)!
        case .body1Bold:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.body1.rawValue)!
        case .body2:
            return UIFont(name: FontStyle.regular.rawValue, size: FontSize.body2.rawValue)!
        case .body2Bold:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.body2.rawValue)!
        case .body3:
            return UIFont(name: FontStyle.regular.rawValue, size: FontSize.body3.rawValue)!
        case .body3Bold:
            return UIFont(name: FontStyle.bold.rawValue, size: FontSize.body3.rawValue)!
        }
    }
}

extension UIFontDescriptor.AttributeName {
    // Custom font descriptor for CT Fonts
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    /// Returns proxima nova regular font.
    @objc class func customSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontStyle.regular.rawValue, size: size)!
    }
    
    /// Returns proxima nova bold font
    @objc class func customBoldSystemFone(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: FontStyle.bold.rawValue, size: size)!
    }
    
    @objc convenience init(myCoder decoder: NSCoder) {
        guard let fontDescriptor = decoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
                let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                    self.init(myCoder: decoder)
                    return
                }
        var fontName = String()
        
        // Replace CT Font attributes with Proxima Nova
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = FontStyle.regular.rawValue
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = FontStyle.bold.rawValue
        default:
            fontName = FontStyle.regular.rawValue
        }
        
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        // Overrides the system font method provided by UIFont with custom implementation
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))), let mySystemFontMethod = class_getClassMethod(self, #selector(customSystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        // Overrides the bold system font method provided by UIFont with custom implementation of bold system font
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))), let myBoldSystemFontMethod = class_getClassMethod(self, #selector(customSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), let customInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, customInitCoderMethod)
        }
    }
}

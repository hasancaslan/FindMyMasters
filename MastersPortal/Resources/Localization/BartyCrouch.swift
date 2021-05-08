//
//  BartyCrouch.swift
//  CalculatorVault
//
//  Created by HASAN CAN on 2/17/21.
//

import Foundation

enum BartyCrouch {
    enum SupportedLanguage: String {
        case english = "en"
        case turkish = "tr"
//        case arabic = "ar"
//        case chineseSimplified = "zh-Hans"
//        case chineseTraditional = "zh-Hant"
//        case french = "fr"
//        case german = "de"
//        case hindi = "hi"
//        case italian = "it"
//        case japanese = "ja"
//        case korean = "ko"
//        case portuguese = "pt-pt"
//        case portugueseBrazil = "pt-br"
//        case russian = "ru"
//        case spanish = "es"
//        case dutch = "nl"
//        case thai = "th"
//        case danish = "da"
//        case vietnamese = "vi"
//        case norwegian = "nb"
//        case polish = "pl"
//        case finnish = "fi"
//        case indonesian = "id"
//        case hebrew = "he"
//        case greek = "el"
//        case romanian = "ro"
//        case hungarian = "hu"
//        case czech = "cs"
//        case catalan = "ca"
//        case slovak = "sk"
//        case ukrainian = "uk"
//        case croatian = "hr"
//        case malay = "ms"
    }

    static func translate(key: String, translations: [SupportedLanguage: String], comment: String? = nil) -> String {
        let typeName = String(describing: BartyCrouch.self)
        let methodName = #function

        print(
            "Warning: [BartyCrouch]",
            "Untransformed \(typeName).\(methodName) method call found with key '\(key)' and base translations '\(translations)'.",
            "Please ensure that BartyCrouch is installed and configured correctly."
        )

        // fall back in case something goes wrong with BartyCrouch transformation
        return "BC: TRANSFORMATION FAILED!"
    }
}

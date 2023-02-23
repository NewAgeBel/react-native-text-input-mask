//
//  RNMask.swift
//  InputMask
//
//  Created by NewAgeBel on 23/02/23.
//  Copyright © 2023 NewAgeBel. All rights reserved.
//
import Foundation
import InputMask

@objcMembers
open class RNMask : NSObject {
    public static func maskValue(text: String, format: String, autcomplete: Bool) -> String {
        let mask : Mask = try! Mask.getOrCreate(withFormat: format)

        let result: Mask.Result = mask.apply(
            toText: CaretString(
                string: text,
                caretPosition: text.endIndex,
                caretGravity: CaretString.CaretGravity.forward(autocomplete: autcomplete)
            )
        )

        return result.formattedText.string
    }

    public static func unmaskValue(text: String, format: String, autocomplete: Bool) -> String {
        let mask : Mask = try! Mask.getOrCreate(withFormat: format)

        let result: Mask.Result = mask.apply(
            toText: CaretString(
                string: text,
                caretPosition: text.endIndex,
                caretGravity: CaretString.CaretGravity.forward(autocomplete: autocomplete)
            )
        )

        return result.extractedValue
    }
}

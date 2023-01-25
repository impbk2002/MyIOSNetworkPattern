//
//  Preconcurrency.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import CodableWrappers

extension Immutable: @unchecked Sendable where T: Sendable {}

extension FallbackDecoding: @unchecked Sendable where ValueProvider.ValueType: Sendable {}
extension FallbackCoding: @unchecked Sendable where ValueProvider.ValueType: Sendable {}
extension FallbackEncoding: @unchecked Sendable where ValueProvider.ValueType: Sendable {}

extension OptionalEncoding: @unchecked Sendable where CustomDecoderWrapper.CustomEncoder.OriginalType: Sendable {}
extension OptionalDecoding: @unchecked Sendable where CustomDecoderWrapper.CustomDecoder.DecodedType: Sendable {}
extension OptionalCoding: @unchecked Sendable where CustomCoderWrapper.CustomEncoder.OriginalType: Sendable {}

extension CodingUses: @unchecked Sendable where CustomCoder.CodingType: Sendable {}
extension DecodingUses: @unchecked Sendable where CustomDecoder.DecodedType: Sendable {}
extension EncodingUses: @unchecked Sendable where CustomEncoder.OriginalType: Sendable {}

extension TransientEncoding: @unchecked Sendable where T: Sendable {}
extension TransientDecoding: @unchecked Sendable where T: Sendable {}
extension TransientCoding: @unchecked Sendable where T: Sendable {}

//
//  DecodableAny.swift
//
//  Created by ICT Fractal Inc. on 2022/04/05.
//

import UIKit

enum DecodableAny: Decodable {
    
    case double(Double), string(String)
    
    enum DecodableAnyError: Error {
        case missingValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else {
            throw DecodableAnyError.missingValue
        }
    }
}

extension DecodableAny {
    
    var intValue: Int? {
        switch self {
        case .double(let value):    return Int(value)
        case .string(let value):    return Int(value)
        }
    }
    
    var doubleValue: Double? {
        switch self {
        case .double(let value):    return value
        case .string(let value):    return Double(value)
        }
    }
    
    var stringValue: String? {
        switch self {
        case .double(let value):    return value.description
        case .string(let value):    return value
        }
    }
}

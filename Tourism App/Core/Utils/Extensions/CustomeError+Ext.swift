//
//  CustomeError+Ext.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import SwiftUI

enum URLError: LocalizedError {
    
    case invalidResponse
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
    
}

enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance."
        case .requestFailed: return "Your request failed."
        }
    }
    
}

struct CircleBackButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 40, height: 40)
            .foregroundColor(Color.red)
            .background(Color.white)
            .opacity(0.8)
            .clipShape(Circle())
    }
}

//  SPDX-License-Identifier: MIT OR Apache-2.0
//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Matei Pralea on 26/04/2024.
//  Copyright © 2024-2025 Matei Pralea. All rights reserved.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
#if os(macOS)
        .windowResizability(.contentSize)
        .windowStyle(HiddenTitleBarWindowStyle())
#endif
    }
}

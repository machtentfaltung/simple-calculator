//  SPDX-License-Identifier: MIT OR Apache-2.0
//
//  ContentView.swift
//  Calculator
//
//  Created by Matei Pralea on 26/04/2024.
//  Copyright © 2024-2025 Matei Pralea. All rights reserved.
//

import SwiftUI

enum Operation {
    case add
    case subtract
    case multiply
    case divide
}

struct ContentView: View {
    @State var numberArray: [Double] = [0, 0]
    @State var selectedNumber = 0
    @State var operation = Operation.add
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(String(format: "%g", numberArray[selectedNumber])).font(.system(size: 30)).minimumScaleFactor(0.9)
            
            Spacer().frame(height: 50)
            
            
            Grid {
                GridRow {
                    if numberArray[0] == 0 && numberArray[1] == 0 {
                        Button("AC") {
                            numberArray[0] = 0
                            numberArray[1] = 0
                            selectedNumber = 0
                        }
                        .gridCellColumns(3)
                    }
                    else {
                        Button("C") {
                            numberArray[0] = 0
                            numberArray[1] = 0
                            selectedNumber = 0
                        }
                        .gridCellColumns(3)
                        
                    }
                    
                    Button("/") {
                        if selectedNumber == 0 {
                            selectedNumber = 1
                            operation = .divide
                        }
                    }
                }
                
                GridRow {
                    Button("7") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 7) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 7
                        }
                    }
                    Button("8") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 8) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 8
                        }
                    }
                    Button("9") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 9) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 9
                        }
                    }
                    Button("X") {
                        if selectedNumber == 0 {
                            
                            selectedNumber = 1
                            operation = .multiply
                        }
                    }
                }
                GridRow {
                    Button("4") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 4) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 4
                        }
                    }
                    Button("5") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 5) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 5
                        }
                    }
                    Button("6") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 6) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 6
                        }
                    }
                    Button("-") {
                        if selectedNumber == 0 {
                            selectedNumber = 1
                            operation = .subtract
                        }
                    }
                }
                GridRow {
                    Button("1") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 1) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 1
                        }
                        
                    }
                    Button("2") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 2) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 2
                        }
                    }
                    Button("3") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10 - 3) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10 + 3
                        }
                    }
                    Button("+") {
                        if selectedNumber == 0 {
                            selectedNumber = 1
                            operation = .add
                        }
                    }
                }
                GridRow {
                    Button("0") {
                        if numberArray[selectedNumber] <= (Double.greatestFiniteMagnitude / 10) {
                            numberArray[selectedNumber] = numberArray[selectedNumber] * 10
                        }
                    }.gridCellColumns(3)
                    
                    Button("=") {
                        if selectedNumber == 1 {
                            switch operation {
                            case .add:
                                selectedNumber = 0
                                numberArray[0] = numberArray[0] + numberArray[1]
                                numberArray[1] = 0
                            case .subtract:
                                selectedNumber = 0
                                numberArray[0] = numberArray[0] - numberArray[1]
                                numberArray[1] = 0
                            case .multiply:
                                selectedNumber = 0
                                numberArray[0] = numberArray[0] * numberArray[1]
                                numberArray[1] = 0
                            case .divide:
                                selectedNumber = 0
                                if numberArray[1] == 0 {
                                    numberArray[0] = 0
                                }
                                else {
                                    numberArray[0] = numberArray[0] / numberArray[1]
                                }
                                numberArray[1] = 0
                            }
                            if operation == .add {
                                selectedNumber = 0
                                numberArray[0] = numberArray[0] + numberArray[1]
                                numberArray[1] = 0
                            }
                        }
                    }
                }
                
            }
        }
#if os(macOS)
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification), perform: { _ in
            NSApp.mainWindow?.standardWindowButton(.zoomButton)?.isHidden = true
        })
        .padding()
        .frame(minWidth: 150, idealWidth: 150, maxWidth: 150, minHeight: 275, idealHeight: 275, maxHeight: 275)
#endif
        .controlSize(.large)
        .buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  pocIvan
//
//  Created by Ivan Pires on 29/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(getSpaceFree())
        }
        .padding()
    }
    
    func getSpaceFree() -> String {
        let fileURL = URL(fileURLWithPath: NSHomeDirectory() as String)
        do {
            let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
            if let capacity = values.volumeAvailableCapacityForImportantUsage {
                let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount: capacity, countStyle: .file)
                
                return "Valor aproximado de espaço livre: \(fileSizeWithUnit)"
            } else {
                return "Capacity is unavailable"
            }
        } catch {
            return "Error retrieving capacity: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}

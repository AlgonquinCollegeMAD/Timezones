//
//  ContentView.swift
//  Timezones
//
//  Created by Vladimir Cezar on 2024-11-29.
//

import SwiftUI

struct ContentView: View {
  @State private var currentDate = Date()
  
  let timeZones = [
    "UTC", "America/New_York",
    "Europe/London",
    "Asia/Tokyo",
    "Australia/Sydney"
  ]
  
  var body: some View {
    NavigationView {
      List {
        ForEach(timeZones, id: \.self) { timeZone in
          HStack {
            Text(timeZone)
              .font(.headline)
            Spacer()
            Text(formatDate(for: timeZone))
              .font(.body)
          }
        }
      }
      .navigationTitle("World Clocks")
      .onAppear {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
          currentDate = Date()
        }
      }
    }
  }
  
  private func formatDate(for timeZone: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    formatter.timeZone = TimeZone(identifier: timeZone)
    return formatter.string(from: currentDate)
  }
}

#Preview {
  ContentView()
}

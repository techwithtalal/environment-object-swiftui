//
// ContentView.swift
// EnvironmentObject
//
// Created by Tech With Talal on 2/8/25.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var message: String = "Hello from ContentView"
}

struct ContentView: View {
    @StateObject private var appData = AppData()

    var body: some View {
        NavigationView {
            VStack {
                Text("ContentView")
                TextField("Enter message", text: $appData.message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                NavigationLink("Go to ChildView1", destination: ChildView1())
            }
        }
        .environmentObject(appData)
    }
}

struct ChildView1: View {
    var body: some View {
        VStack {
            Text("ChildView1")
                .padding()
            NavigationLink("Go to ChildView2", destination: ChildView2())
        }
        .padding()
    }
}

struct ChildView2: View {
    var body: some View {
        VStack {
            Text("ChildView2")
                .padding()
            NavigationLink("Go to LastChildView", destination: LastChildView())
        }
        .padding()
    }
}

struct LastChildView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        VStack {
            Text("LastChildView")
                .padding()
            Text("Message: \(appData.message) ")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  DueColonne
//
//  Created by Luca on 1/18/22.
//

import SwiftUI

enum Sport: String, CaseIterable, Identifiable {
    case calcio
    case tennis
    case basket
    case rugby
    case hockey
    var id: String { rawValue }
}

struct Sidebar: View {

    @Binding var selezione: Sport?

    var body: some View {
        List(Sport.allCases, id: \.self, selection: $selezione) { sport in
            Text(sport.rawValue)
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar, label: {
                Image(systemName: "sidebar.left").help("Toggle Sidebar")
            })
        }
        .frame(minWidth: 150)
    }
}

struct DetailView: View {

    var selezione: Sport

    var body: some View {
        switch selezione {
        case .calcio:
            Text("⚽️ \(selezione.rawValue)").font(.title).frame(minWidth: 200)
        case .tennis:
            Text("🎾 \(selezione.rawValue)").font(.title).frame(minWidth: 200)
        case .basket:
            Text("🏀 \(selezione.rawValue)").font(.title).frame(minWidth: 200)
        case .rugby:
            Text("🏉 \(selezione.rawValue)").font(.title).frame(minWidth: 200)
        case .hockey:
            Text("🏒 \(selezione.rawValue)").font(.title).frame(minWidth: 200)
        }
    }
}

private func toggleSidebar() {
    NSApp.keyWindow?.contentViewController?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct ContentView: View {
    @AppStorage("selezione") private var selezione: Sport = .calcio
    
    var body: some View {
        NavigationView {
                   Sidebar(selezione: Binding($selezione))
                   DetailView(selezione: selezione)
               }
               .frame(width: 800, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


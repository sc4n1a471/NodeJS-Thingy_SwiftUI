//
//  ContentView.swift
//  NodeJS_Thingy_Cars
//
//  Created by Martin Terhes on 6/30/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                QueryView()
                    .tabItem {
                        Label("Query Car", systemImage: "magnifyingglass")
                    }
                MyCarsView()
                    .tabItem {
                        Label("My Cars", systemImage: "tray.full")
                    }
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
            }
        }
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

extension View {
		/// Applies the given transform if the given condition evaluates to `true`.
		/// - Parameters:
		///   - condition: The condition to evaluate.
		///   - transform: The transform to apply to the source `View`.
		/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}

#Preview {
    ContentView()
        .environment(SharedViewData())
}

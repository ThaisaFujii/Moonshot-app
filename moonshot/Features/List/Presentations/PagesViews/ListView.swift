//
//  ListView.swift
//  moonshot
//
//  Created by Thaisa Fujii on 7/4/22.
//

import SwiftUI

struct ListView: View {
    @State var isShowing = false
    @State var isShowingToolBar = false
    
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    //, astronauts: astronauts
                    MissionView(mission: mission)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackGround)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackGround)
            )
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                NavigationLink(destination: ContentView(), isActive: $isShowing){}
                Button("Grid") {
                    isShowing = true
                    print("Pressed")
                }
                Spacer()
                Button("list") {
                    isShowing = false
                    print("Pressed")
                }
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

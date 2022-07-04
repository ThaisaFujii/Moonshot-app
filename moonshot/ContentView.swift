//
//  ContentView.swift
//  moonshot
//
//  Created by Thaisa Fujii on 6/30/22.

import SwiftUI

struct ContentView: View {
    @State var isShowing = false
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                //A container view that arranges its child views in a grid that grows vertically, creating items only as needed.
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            //, astronauts: astronauts
                            MissionView(mission: mission)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
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
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackGround)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
            // Challenge
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
              //      NavigationLink(destination: ContentView(), isActive: $isShowing){}
                    Button("Grid") {
                        isShowing = false
                        print("Pressed")
                    }
                    Spacer()
                    NavigationLink(destination: ListView(), isActive: $isShowing){}
                    Button("list") {
                        isShowing = true
                        print("Pressed")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

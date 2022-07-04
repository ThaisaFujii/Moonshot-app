//
//  MissionView.swift
//  moonshot
//
//  Created by Thaisa Fujii on 7/1/22.
//

import SwiftUI

struct MissionView: View {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: Mission
    
    var body: some View {
        //using GeometryReader to get precise sizes to make the most of our space.
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)

                    VStack(alignment: .leading) {
                        Text("Launch Date: \(mission.formattedLaunchDate)")
                      //  Divider()
                      // costumize my own divider
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackGround)
                            .padding(.vertical)
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackGround)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                    
                    CrewView(mission: mission, astronauts: astronauts)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackGround)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(mission: missions[0])
    }
}

//
//  AstronautView.swift
//  moonshot
//
//  Created by Thaisa Fujii on 7/1/22.
//

import SwiftUI

struct AstronautView: View {
    let astrounaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astrounaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astrounaut.description)
                    .padding()
            }
        }
        .background(.darkBackGround)
        .navigationTitle(astrounaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astrounaut: astronauts["armstrong"]!)
    }
}

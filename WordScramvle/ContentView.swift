//
//  ContentView.swift
//  WordScramvle
//
//  Created by Teneocto on 12/8/20.
//  Copyright © 2020 NguyenCaoThiem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                Section(header:Text("List1")){
                    ForEach(0..<100) {
                        Text("Dynamic row \($0)")
                    }
                }
            }
            .navigationBarItems(leading:
                Button(action: {
                    //TODO
                }){
                    Text("Back")
                }
            )
                .navigationBarTitle("Testing List",displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

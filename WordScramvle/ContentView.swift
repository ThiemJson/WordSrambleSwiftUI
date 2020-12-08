//
//  ContentView.swift
//  WordScramvle
//
//  Created by Teneocto on 12/8/20.
//  Copyright © 2020 NguyenCaoThiem. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var usedWords = [String]()
    @State private var rootWord = "WordSramble"
    @State private var newWord = ""
    
    var body : some View {
        NavigationView{
            VStack{
                TextField("Enter your words", text: $newWord, onCommit:addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .padding()
                
                List(self.usedWords, id: \.self){
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(Text(self.rootWord), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    //TODO
                }){
                    Text("Back")
                }
            )
            .onAppear(perform: startGame)
        }
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    func addNewWord(){
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = self.newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
        // extra validation to come
        
        self.usedWords.insert(answer, at: 0)
        self.newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

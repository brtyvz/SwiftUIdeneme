//
//  ContentView.swift
//  SwiftUIdeneme
//
//  Created by Berat Yavuz on 11.04.2022.
//

import SwiftUI
class Veri:ObservableObject{
    
    @Published var sayac : Int = 0
    
}

struct ContentView: View {
    @ObservedObject var gelenVeri = Veri()
    var body: some View {
        NavigationView{
        VStack{
            Text("sayı:\(gelenVeri.sayac)")
            Button(action: {gelenVeri.sayac+=1}, label: {
                Text("Arttır")
                
                NavigationLink(
                    destination: ContentView2(sonveri: self.$gelenVeri.sayac),
                    label: {
                        Text("Navigate")
                    })
            })
            
        }
        }.navigationTitle( "ilk sayfa" )
    }
}

struct ContentView2: View {
    @Binding var sonveri : Int
    var body: some View {
        VStack{
            Text("sonveri\(sonveri)")
            Button(action: {self.sonveri += 1}) {
                Text("Button arttır")
            }
            
        }.navigationTitle("ikinci sayfa")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

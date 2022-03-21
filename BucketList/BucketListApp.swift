//
//  BucketListApp.swift
//  BucketList
//
//  Created by student on 3/20/22.
//

import SwiftUI

@main
struct BucketListApp: App {

   @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ListView()

            }
            .environmentObject(listViewModel)
        }
    }
}

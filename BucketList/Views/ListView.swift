//
//  ListView.swift
//  BucketList
//
//  Created by student on 3/20/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.items){item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
        .listStyle(PlainListStyle())
        .navigationTitle("My Lists")
        .navigationBarItems(trailing: NavigationLink("Add", destination: AddItemView()))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
        .environmentObject(ListViewModel())
    }
}




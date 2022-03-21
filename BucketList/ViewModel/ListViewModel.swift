//
//  ListViewModel.swift
//  BucketList
//
//  Created by student on 3/20/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            savedItems()
        }
    }
    let itemsKey: String = "items_list"

    init(){
        getItems()
    }
    
    func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems

    }

    func addItem(title: String){

        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        savedItems()
    }

    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
            savedItems()
       }
    }
    func savedItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

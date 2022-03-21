//
//  AddItemView.swift
//  BucketList
//
//  Created by student on 3/20/22.
//

import SwiftUI

struct AddItemView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textField: String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Enter the text", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray)
                    .cornerRadius(10)

                Button(action: saveButtonPressed, label:{
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10
                        )

                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
    }
    func saveButtonPressed(){
        listViewModel.addItem(title: textField)
        presentationMode.wrappedValue.dismiss()

    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddItemView()
    }
        .environmentObject(ListViewModel())
}
}

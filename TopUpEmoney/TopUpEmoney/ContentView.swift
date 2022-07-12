//
//  ContentView.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @EnvironmentObject var viewModel : ViewModel
    
    @State var isPresented = false
      @State var showListCategory = false
    @State var selectedCategory : String = ""
    
    private func renderTitleSavedList()-> some View{
        Text("Or Choose from your saved list")
        .padding(.all,20)
    }
    
   
    var body: some View {
        NavigationView{
            ZStack{
                Color.pink.opacity(0.4)
                VStack(alignment:.leading){
                    Content(isPresented: $isPresented, showListCategory: $showListCategory, selectedCategory: $selectedCategory)
                    renderTitleSavedList()
                    
                    SavedListCustom(category: "OVO", phoneNumber: 239238932)
                        .padding([.leading, .trailing],20)
                    Spacer()
                }
              
               
                .navigationBarTitle(
                    "Topup e-Money",
                    displayMode: .inline
                )
            }
                       .bottomSheet(
                           isPresented: $showListCategory,
                           height: 370,
                           topBarHeight: 16,
                           topBarCornerRadius: 16,
                           showTopIndicator: false
                       ) {
                           ListCategory(selectedCategory: $selectedCategory)
                       }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct Content : View{
    @State var navigationSelection : String?
    
    @Binding var isPresented : Bool
    @Binding var showListCategory : Bool
    @Binding  var selectedCategory : String
    
  
   
    var body: some View{
        
        VStack{
           
            VStack{
                
                Text(selectedCategory)
               CustomTextField(
                text: selectedCategory ,
                    placeholder: "Choose Category",
                    title: "Category",
                   icon: "chevron.right",
                required: "Required"
               ).disabled(true)
                    .onTapGesture {
                        self.isPresented = true
                        self.showListCategory = true
                    }
                
                CustomTextField(
                     text: "",
                     placeholder: "Input your phone number",
                     title: "Phone Number",
                     required: "Required"
                )
                NavigationLink(
                    destination: BillPayment(sourceNavigationLink: $navigationSelection),
                    tag: ScreenName.BillPayment.rawValue,
                    selection: $navigationSelection
                )
                {EmptyView ()}
                   
              
                PrimaryButton(
                    title: "Contionue",
                    action: {
//                        validation()
//                        self.navigationSelection = ScreenName.BillPayment.rawValue
                    }
                )
                
            }.padding(.all, 20)
        }
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: .infinity)
        .padding([.leading, .trailing],20)
        .shadow(color: .black, radius: 0.3)
        .padding(.top,20)
       

    }
}

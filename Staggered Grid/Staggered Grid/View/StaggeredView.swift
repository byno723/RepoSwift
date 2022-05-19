//
//  StaggeredView.swift
//  Staggered Grid
//
//  Created by gorbyno sitepu on 19/05/22.
//

import SwiftUI

//custum view builder
//T -> is to hold the identifiable collection of data

struct StaggeredView<Content : View, T: Identifiable>:View where T : Hashable{
    
//    it will return each object from collection to build view
    var content : (T) -> Content
    var list : [T]
//    columns
    var columns  : Int
    
//    properties
    var showIndicators : Bool
    var spacing : CGFloat
    
    init(columns: Int,showIndicators: Bool = false ,spacing: CGFloat = 10 ,list: [T], @ViewBuilder content : @escaping (T)-> Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showIndicators = showIndicators
        self.columns = columns
    }
    
//    staggered grid function
    func setUpList()->[[T]]{
//        creating empty sub arrayof columns count
        
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
//        splitting array for vstack oriented view
        var currentIndex = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
//            increasing index count
//            and resetting if overbounds the columns count
            if currentIndex == (columns - 1){
                currentIndex = 0
            }else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View {
        
     
            HStack(alignment:.top, spacing: 20){
                ForEach(setUpList(), id:\.self){columnsData in
//                   for optimized using lazystack
                    LazyVStack(spacing: spacing){
                        ForEach(columnsData){object in
                            content(object)
                            
                        }
                    }.padding(.top, getIndex(values: columnsData)==1 ? 80 :0 )
                    
                }
            }
//            only vertical padding
//            horizontal padding will be users optional
            .padding(.vertical)
    }
    
//    moving second row little down
    func getIndex(values : [T])->Int {
        let index = setUpList().firstIndex{ t in
            return t == values
        } ?? 00
        return index
    }
}

struct StaggeredView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

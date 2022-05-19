//
//  Home.swift
//  Staggered Grid
//
//  Created by gorbyno sitepu on 19/05/22.
//

import SwiftUI

struct Home: View {
    @State var posts : [Post] = []
//    to show dynamic
    @State var columns: Int = 2
    
//    smooth hero effect
    @Namespace var animation
    
    var body: some View {
        NavigationView{
           
            StaggeredView(columns: columns, list: posts, content: { post in
//               Post card view
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
                    .onAppear{
                        print(post.imageURL)
                    }
                
            })
            .padding(.horizontal)
            .navigationTitle("Staggered Grid")
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                        columns += 1
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                        columns  = max(columns - 1 , 1)
                    }label: {
                        Image(systemName: "minus")
                    }
                }
//                animation
            
            }.animation(.easeInOut, value: columns)
        }.onAppear{
            for index in 1...10{
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//since we declared T as Identifiable
//so we need to pass Identifiable conform
//collectin array


struct PostCardView : View{
    var post : Post
    var body: some View{
        Image(post.imageURL).resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
    }
}

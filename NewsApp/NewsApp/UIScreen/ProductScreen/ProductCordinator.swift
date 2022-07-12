//
//  ProductCordinator.swift
//  NewsApp
//
//  Created by gorbyno sitepu on 12/07/22.
//

import SwiftUI

struct ProductCordinator: View {
    @Binding var selectionCoordinatorName : String?
    
    var body: some View {
        NavigationLink(
            destination: ProductScreen(
//                viewModel: createViewModel()
            ),
            tag: ProductCordinator.named,
            selection: $selectionCoordinatorName)
        {EmptyView()}
    }
    
    
}

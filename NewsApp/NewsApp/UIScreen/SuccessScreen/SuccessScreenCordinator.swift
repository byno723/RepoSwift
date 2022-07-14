//
//  SuccessScreenCordinator.swift
//  NewsApp
//
//  Created by Gorbyno S on 14/07/22.
//

import SwiftUI

struct SuccessScreenCordinator: View {
    @Binding var selectionCoordinatorName : String?
    var body: some View {
        NavigationLink(
            destination: SuccessScreen(
//                viewModel: createViewModel()
            ),
            tag: SuccessScreenCordinator.named,
            selection: $selectionCoordinatorName)
        {EmptyView()}
    }
}

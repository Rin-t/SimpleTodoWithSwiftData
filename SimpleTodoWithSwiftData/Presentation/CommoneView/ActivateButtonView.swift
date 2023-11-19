//
//  ActivateView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI

struct ActivateButtonView: View {

    @Binding var isActive: Bool

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Button(action: {
                    isActive = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 24)
                .padding(.trailing, 32)
            }
        }
    }
}

#Preview {
    @State var isActive = false
    return ActivateButtonView(isActive: $isActive)
}

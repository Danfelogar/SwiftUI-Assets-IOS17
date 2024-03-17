//
//  PhotoPicker.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    //MARK: - Properties
    //@State private var avatarImage: UIImage?
    @State private var images: [UIImage] = []
    //single
    //@State private var photosPickerItem: PhotosPickerItem?
    //multi
    @State private var photosPickerItems: [PhotosPickerItem] = []
    //MARK: - Body
    var body: some View {
        VStack {
            PhotosPicker("Select Photos" , selection: $photosPickerItems, maxSelectionCount: 5, selectionBehavior: .ordered)
                ScrollView(.horizontal) {
                    HStack (spacing: 20) {
                        //Single picker img
                        //PhotosPicker(selection: $photosPickerItem, matching: .images) {
                        ForEach(0..<images.count, id: \.self) { i in
                            Image(uiImage: images[i])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(.circle)
                        }//: Loop
                    }//: HStack
                }//: Scroll
            
            //            VStack(alignment: .leading ) {
            //                Text("DanFeLoGar")
            //                    .font(.largeTitle.bold())
            //
            //                Text("iOS Developer")
            //                    .font(.headline)
            //                    .foregroundStyle(.secondary)
            //            }//: VStack
            
            Spacer()
            
        }//: VStack
        .padding(30)
//        .onChange(of: photosPickerItem) { _, _ in
//            Task {
//                if let photosPickerItem, let data = try? await photosPickerItem.loadTransferable(type: Data.self){
//                    if let image = UIImage(data: data) {
//                        avatarImage = image
//                    }
//                }
//                
//                photosPickerItem = nil
//            }
//        }
        .onChange(of: photosPickerItems) { _, _ in
            Task {
                for item in photosPickerItems {
                    if let data = try? await item.loadTransferable(type: Data.self){
                        if let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                }
                
                photosPickerItems.removeAll()
            }
        }
}
}

#Preview { PhotoPicker() }

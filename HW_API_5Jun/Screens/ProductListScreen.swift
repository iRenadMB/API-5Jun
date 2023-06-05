
import SwiftUI
//
//struct ProductListScreen: View {
//
//    let category: Category
//    @State private var isPresented: Bool = false
//    @EnvironmentObject private var storeModel: StoreModel
//
//    var body: some View {
//
//        List (storeModel.products, id: \.id) { product in
//            ProductCellView(product: product)
//        }
//
//        .listStyle(.plain)
//        .task {
//            do {
//                try await storeModel.fetchProductsByCategory (category.id)
//            } catch {
//                print (error)
//            }
//        }.navigationTitle(category.name)
//    }
//}
//struct ProductListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            ProductListScreen(category: Category(id: 1, name: "Clothes", image: URL(string: "https://images.unsplash.com/photo-1620799140408-edc6deb6d633?ixlib=rb-4.0.38ixid=MnwxMjADB8MHxwaG90by1wYWdlfH×8fGufDB8fHx8&auto=format&fit=crop&w=1072&q=80")!))
//                .environmentObject(StoreModel())
//        }
//    }
//}

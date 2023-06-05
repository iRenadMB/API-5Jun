
import SwiftUI

struct AddProductScreen: View {
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var selectedCategory: Category?
    @State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    @EnvironmentObject private var storeModel: StoreModel
    @State var isLoading = true
    @State var categoies: [Category] = []
    @State var alertMessage = ""
    @State var isAlertShown = false


    var body: some View {

//        Form {
//
//            TextField("Enter title", text: $title)
//            TextField("Enter price", value: $price, format: .number)
//            TextField("Enter description", text: $description)
//            Picker ("Categories", selection: $selectedCategory) {
//                ForEach(storeModel.categories, id: \.id) { category in
//                    Text (category.name)
//                }
//
//            }.pickerStyle(.wheel)
//            TextField("Image urI", text: $imageUrl)
//        }.navigationTitle("Add Product")
//            .onAppear {
//                selectedCategory = storeModel.categories.first
//            }
        func deleteOneTodo(categoryId: Int) async {
            isLoading = true
            do {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                let urlString = URL.development
                let request = try urlString.toDeleteRequest()
                let result = try await callApi(request, to: DeleteTodoApiResponse.self)
                categoies = result.newTodos
                if !result.success {
                    alertMessage = result.message
                    isAlertShown = true
                }

            } catch {
                print("Error: \(error)")
            }
            isLoading = false
        }
    }
}

struct DeleteTodoApiResponse: Codable {
    let success: Bool
    let newTodos: [Category]
    let message: String
}


import SwiftUI

struct CategoryListScreen: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    @State private var errorMessage = ""
    @State var isLoading = true
    @State var categoies: [Category] = []
    @State private var isPresented: Bool = false

    var body: some View {
        
        NavigationView {
            VStack {
                List(storeModel.categories, id: \.id) { category in

                    Text(category.name)
                    Text(category.email)

                } .task {
                    isLoading = true
                    do {
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        try await storeModel.fetchCategories()
                        
                    } catch {
                        errorMessage = error.localizedDescription
                    }
                    isLoading = false
                }
                Text (errorMessage)
                    .toolbar {
                        ToolbarItem (placement: .navigationBarTrailing) {
                            Button("Add Product") {
                                isPresented = true
                            }
                        }
                    }.sheet(isPresented: $isPresented) {
                        AddProductScreen()
                    }
            }
        }
        
//        func upsertOneTodo(todo: Category) async {
//            isLoading = true
//            do {
//                try await Task.sleep(nanoseconds: 1_000_000_000)
//                let urlString = URL.development + "/users"
//                let request = try urlString.toRequest(withBody: todo, method: "PUT")
//                let result = try await callApi(request, to: DeleteTodoApiResponse.self)
//                todos = result.newTodos
//            } catch {
//                print("Error: \(error)")
//            }
//            isLoading = false
//        }
    }
    struct DeleteTodoApiResponse: Codable {
        let success: Bool
        let newTodos: [Category]
        let message: String
    }

}


struct CategoryListScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CategoryListScreen().environmentObject(StoreModel())
    }
}


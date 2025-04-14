import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool
    @State private var showFilter = false
    let cuisineOptions = DataHelper.getCuisines()
//    ["Japanese", "Asian", "Italian", "Indonesian", "Western", "Chinese", "European", "Thai"]
//    DataHelper.loadRestaurants().flatMap { $0.cuisine }
    
    @State private var selectedCuisines: Set<String> = []
    
    @State private var selectedPrice = 0
    @State private var selectedFilterCuisines: Set<String> = []
    @State private var isHalal = false
    @State private var isNonHalal = false
    @State private var isIndoor = false
    @State private var isOutdoor = false
    @State private var isSmokingFriendly = false
    @State private var isNonSmoking = false
    
    @State private var restaurants: [Restaurant] = DataHelper.loadRestaurants()
    
    private var filteredRestaurants: [Restaurant] {
        restaurants.filter { restaurant in
            let matchesSearch = searchText.isEmpty || restaurant.name.localizedCaseInsensitiveContains(searchText)
            let matchesCuisine = selectedFilterCuisines.isEmpty || selectedFilterCuisines.contains(restaurant.cuisine)
            let matchesPrice = selectedPrice == 0 || restaurant.priceLevel == selectedPrice
            let matchesHalal = !isHalal || restaurant.isHalal
            let matchesNonHalal = !isNonHalal || restaurant.isNonHalal
            let matchesIndoor = !isIndoor || restaurant.isIndoor
            let matchesOutdoor = !isOutdoor || restaurant.isOutdoor
            let matchesSmoking = !isSmokingFriendly || restaurant.isSmokingFriendly
            let matchesNonSmoking = !isNonSmoking || restaurant.isNonSmoking
            
            return matchesSearch && matchesCuisine && matchesPrice &&
                matchesHalal && matchesNonHalal && matchesIndoor && matchesOutdoor &&
                matchesSmoking && matchesNonSmoking
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search restaurants...", text: $searchText)
                        .focused($isSearchFieldFocused) // Ensure field is focusable
                        .submitLabel(.search) // Enables return key to trigger search
                        .onSubmit {isSearchFieldFocused = false}
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.leading)
                        
                    
                    Button(action: {
                        showFilter = true
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.foozy)
                            .padding(.trailing)
                    }
                }
                .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(cuisineOptions.sorted { selectedFilterCuisines.contains($0) && !selectedFilterCuisines.contains($1) }, id: \.self) { cuisine in
                            Button(action: {
                                if selectedFilterCuisines.contains(cuisine) {
                                    selectedFilterCuisines.remove(cuisine)
                                } else {
                                    selectedFilterCuisines.insert(cuisine)
                                }
                            }) {
                                Text(cuisine)
                                    .font(.system(size: 12, weight: .bold))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(selectedFilterCuisines.contains(cuisine) ? Color.foozy : Color.white)
                                    .foregroundColor(selectedFilterCuisines.contains(cuisine) ? Color.white : Color.foozy)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.foozy, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                }
                
                ScrollView {
                    if filteredRestaurants.isEmpty {
                        VStack {
                            Text(" ")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                            Text(" ")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
//                            Text(" ")
//                                .font(.headline)
//                                .foregroundColor(.gray)
//                                .background(Color.red)
//                                .multilineTextAlignment(.center)
//                                .padding()
                            Image("FoozyGhost")
//                                .frame()
                            Text("No restaurants found. A little tweak might help!")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                                
                        }
//                        .background(Color.red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    } else {
                        VStack(spacing: 15) {
                            ForEach(filteredRestaurants) { restaurant in
                                NavigationLink(destination: RestaurantDetTrial(restaurant: restaurant)) {
                                    RestaurantCard(restaurant: restaurant)
                                        .padding(1)
                                }
                                .buttonStyle(PlainButtonStyle())
                                // use list instead of scrollview
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("List of Restaurants")
            .sheet(isPresented: $showFilter) {
                FilterView(isPresented: $showFilter,
                           selectedPrice: $selectedPrice,
                           selectedFilterCuisines: $selectedFilterCuisines,
                           isHalal: $isHalal,
                           isNonHalal: $isNonHalal,
                           isIndoor: $isIndoor,
                           isOutdoor: $isOutdoor,
                           isSmokingFriendly: $isSmokingFriendly,
                           isNonSmoking: $isNonSmoking,
                           filteredCount: filteredRestaurants.count)
            }
        }
    }
}
#Preview {
    ContentView()
//    SearchView()
}

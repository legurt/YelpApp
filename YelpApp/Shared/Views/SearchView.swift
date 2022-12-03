//
//  SearchView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 17.11.2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel

    @State private var keyword: String = ""
    @State private var distance: String = "10"
    @State private var category: String = "Default"
    @State private var location: String = ""
    @State private var autoDetectToggle: Bool = false
    @State private var isShowingAutocomplete = false

    var body: some View {
        HStack {
            Text("Keyword:")
                .foregroundColor(ColorConstants.inputNameTextColor)
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
            
            TextField("Required", text: $keyword)
            .onChange(of: keyword) { newValue in
                if newValue.count != 0 {
                    isShowingAutocomplete = true
                    viewModel.getAutocompleteOptions(text: keyword)
                } else {
                    isShowingAutocomplete = false
                }
            }
            .alwaysPopover(isPresented: $isShowingAutocomplete) {
                if viewModel.isLoadingAutocomplete {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            ProgressView()
                            Text("loading...")
                                .foregroundColor(ColorConstants.inputNameTextColor)
                        }
                        Spacer()
                    }.frame(maxWidth: .infinity, maxHeight: 60)
                }
                VStack {
                    ForEach(viewModel.autocompleteOptions, id: \.self) { option in
                        Text("\(option)")
                            .foregroundColor(ColorConstants.inputNameTextColor)
                            .onTapGesture {
                                keyword = option
                            }
                    }
                }.padding(15)
            }
        }
        HStack {
            Text("Distance:")
                .foregroundColor(ColorConstants.inputNameTextColor)
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

            TextField("", text: $distance)
        }
        HStack {
            Text("Category:")
                .foregroundColor(ColorConstants.inputNameTextColor)
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

            Picker("", selection: $category) {
                ForEach(PickerOptionsConstants.categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
        }
        if !autoDetectToggle {
            HStack {
                Text("Location:")
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                TextField("Required", text: $location)
                    .onSubmit {
                        viewModel.locationCollected = false
                        viewModel.getGeocodingByLocation(location)
                    }
            }
        }
        HStack {
            Text("Auto-detect my location")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(ColorConstants.inputNameTextColor)
                .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

            Toggle("", isOn: $autoDetectToggle)
                .onChange(of: autoDetectToggle, perform: { newValue in
                    viewModel.locationCollected = false
                    if newValue {
                        viewModel.getIpInfo()
                    }
                })
                .labelsHidden()
        }
        HStack {
            Button("Submit") {
                submitTapped()
            }
            .disabled(!isSearchValid())
            .frame(width: 120.0, height: 55.0)
            .background(!isSearchValid() ? ColorConstants.submitButtonDisabledColor : .red)
            .foregroundColor(.white)
            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .padding()
            .buttonStyle(BorderlessButtonStyle())

            Button("Clear") {
                clearTapped()
            }
            .frame(width: 120.0, height: 55.0)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .padding()
            .buttonStyle(BorderlessButtonStyle())
        }
    }
    
    func isSearchValid() -> Bool {
        let locationEntered = autoDetectToggle || location != ""
        return locationEntered && keyword != "" && viewModel.locationCollected
    }
    
    func submitTapped() {
        viewModel.getBusinesses(latitude: viewModel.latitude,
                                longitude: viewModel.longitude,
                                term: keyword,
                                distance: distance,
                                categories: category)
    }

    func clearTapped() {
        keyword = ""
        distance = "10"
        category = "Default"
        location = ""
        autoDetectToggle = false
        viewModel.businesses = []
        viewModel.noResults = false
    }
}

//
//  ProfileScreen.swift
//  Profile
//
//  Created by Jay Phillips on 1/2/20.
//  Copyright © 2020 Jay Phillips. All rights reserved.
//

import SwiftUI

struct ThemeTextField: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10.0)
            .background(Color.red)
            .cornerRadius(5)
    }
}

struct ProfileScreen: View {
    @State private var profile = ProfileModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("Basic Information")
                Section {
                    TextField("First Name", text: $profile.firstName)
                    TextField("Last Name", text: $profile.lastName)
                    TextField("Age", text: $profile.age)
                }
                Text("Shipping Information")
                Section {
                    TextField("Street Address", text: $profile.streetAddress)
                    TextField("State / Province", text: $profile.stateProvince)
                    TextField("Postal Code", text: $profile.postalCode)
                    TextField("Country", text: $profile.country)
                }
                Section {
                    ProfilePreview(profile: profile)
                }
            }
            .padding(16.0)
        .textFieldStyle(ThemeTextField())
        .navigationBarTitle(Text("Profile"))
        .navigationBarItems(trailing: Button(action: {self.submit()}) {
                Text("Submit")
            })
        }
    }
    
    private func submit() {
        UserService.instance.saveProfile(profile: profile)
        profile = ProfileModel()
        // show next screen
    }
}

struct ProfilePreview: View {
    var profile: ProfileModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("First Name: \(profile.firstName)")
            Text("Last Name: \(profile.lastName)")
            Text("Age: \(profile.age)")
        }
    }
}


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

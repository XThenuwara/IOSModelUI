//
//  Navbar.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-20.
//
import SwiftUI


struct Navbar: View {
    @State private var isLeadingDrawerOpen = false;
    @State private var isTrailingDrawerOpen = false;
    var title: String
    var leadingIcon: String?
    var trailingIcon: String?
    var LeadingDrawer: AnyView?
    var TrailingDrawer: AnyView?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.text)
                
                if let leadingIcon = leadingIcon {
                    Button(action: {
                        withAnimation {
                            isLeadingDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: leadingIcon)
                            .font(.title2)
                            .foregroundColor(Color.primary)
                    }
                }
                
                if let trailingIcon = trailingIcon {
                    Button(action: {
                        withAnimation {
                            isTrailingDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: trailingIcon)
                            .font(.title2)
                            .foregroundColor(Color.primary)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.background)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
            .sheet(isPresented: $isLeadingDrawerOpen) {
                if let LeadingDrawer = LeadingDrawer {
                    DrawerMenu(
                        isOpen: $isLeadingDrawerOpen,
                        DrawerView: LeadingDrawer
                    )
                }
                
            }
            .background(Color.blue.edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isTrailingDrawerOpen) {
                if let TrailingDrawer = TrailingDrawer {
                    DrawerMenu(
                        isOpen: $isTrailingDrawerOpen,
                        DrawerView: TrailingDrawer
                    )
                }
            }
            .background(VisualEffectBlur(effect: .systemMaterial))
            
            
        }
    }
}


struct DrawerMenu: View {
    @Binding var isOpen: Bool
    var DrawerView: AnyView
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 15)
                        .foregroundColor(.secondaryBackground)
                        .padding()
                    
                    Spacer()
                }.onTapGesture {
                    withAnimation {
                        isOpen.toggle()
                    }
                }
                
                DrawerView
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .offset(y: isOpen ? 0 : UIScreen.main.bounds.height)
            .animation(.easeInOut, value: isOpen)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    Navbar(title: "Test",
           leadingIcon: "xmark",
           trailingIcon: "xmark",
           TrailingDrawer: AnyView(SearchDrawer()))
}

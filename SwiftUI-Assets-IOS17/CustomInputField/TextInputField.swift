//
//  TextInputField.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 1/07/24.
//

import SwiftUI
import Combine

public struct TextInputField: View {
    private var title: String
    @Binding private var text: String
    @Environment(\.clearButtonHidden) var clearButtonHidden
    @Environment(\.isMandatory) var isMandatory
    @Environment(\.validationHandler) var validationHandler
    
    @Binding private var isValidBinding: Bool
    @State private var isValid: Bool = true {
        didSet {
            isValidBinding = isValid
        }
    }
    @State var validationMessage: String = ""
    @State private var hasFocus: Bool = false
    
    public init(_ title: String, text: Binding<String>, isValid isValidBinding: Binding<Bool>? = nil) {
        self.title = title
        self._text = text
        self._isValidBinding = isValidBinding ?? .constant(true)
    }
    
    var clearButton: some View {
        HStack {
            if !clearButtonHidden {
                Spacer()
                Button(action: { text = "" }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.systemGray))
                }
            }
            else  {
                EmptyView()
            }
        }
    }
    
    var clearButtonPadding: CGFloat {
        !clearButtonHidden ? 25 : 0
    }
    
    fileprivate func validate(_ value: String) {
        isValid = true
        if isMandatory {
            isValid = !value.isEmpty
            if hasFocus {
                validationMessage = isValid ? "" : "This is a mandatory field"
            }
        }
        
        if isValid {
            guard let validationHandler = self.validationHandler else { return }
            
            let validationResult = validationHandler(value)
            
            if case .failure(let error) = validationResult {
                isValid = false
                self.validationMessage = "\(error.localizedDescription)"
            }
            else if case .success(let isValid) = validationResult {
                self.isValid = isValid
                self.validationMessage = ""
            }
        }
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            if !isValid {
                Text(validationMessage)
                    .foregroundColor(.red)
                    .offset(y: -25)
                    .scaleEffect(0.8, anchor: .leading)
            }
            if (text.isEmpty || isValid) {
                Text(title)
                    .foregroundColor(text.isEmpty ? Color(.placeholderText) : .accentColor)
                    .offset(y: text.isEmpty ? 0 : -25)
                    .scaleEffect(text.isEmpty ? 1: 0.8, anchor: .leading)
            }
            TextField("", text: $text)
                .onAppear {
                    validate(text)
                }
                .onChange(of: text) { value in
                    validate(value)
                }
                .onTapGesture {
                    hasFocus = true
                    validate(text)
                }
                .onTapGesture {
                    hasFocus = false
                }
                .padding(.trailing, clearButtonPadding)
                .overlay(clearButton)
        }
        .padding(.top, 15)
        .animation(.default, value: text)
    }
}

// MARK: - Clear Button

extension View {
    public func clearButtonHidden(_ hidesClearButton: Bool = true) -> some View {
        environment(\.clearButtonHidden, hidesClearButton)
    }
}

private struct TextInputFieldClearButtonHidden: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var clearButtonHidden: Bool {
        get { self[TextInputFieldClearButtonHidden.self] }
        set { self[TextInputFieldClearButtonHidden.self] = newValue }
    }
}

// MARK: - Mandatory Field

extension View {
    public func isMandatory(_ value: Bool = true) -> some View {
        environment(\.isMandatory, value)
    }
}

private struct TextInputFieldMandatory: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var isMandatory: Bool {
        get { self[TextInputFieldMandatory.self] }
        set { self[TextInputFieldMandatory.self] = newValue }
    }
}

// MARK: - Validation Handler

public struct ValidationError: Error {
    public init(message: String) {
        self.message = message
    }
    let message: String
}

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString("\(message)", comment: "Message for generic validation errors.")
    }
}

private struct TextInputFieldValidationHandler: EnvironmentKey {
    static var defaultValue: ((String) -> Result<Bool, ValidationError>)?
}

extension EnvironmentValues {
    var validationHandler: ((String) -> Result<Bool, ValidationError>)? {
        get { self[TextInputFieldValidationHandler.self] }
        set { self[TextInputFieldValidationHandler.self] = newValue }
    }
}

extension View {
    public func onValidate(validationHandler: @escaping (String) -> Result<Bool, ValidationError>) -> some View {
        environment(\.validationHandler, validationHandler)
    }
}

// MARK: - Previews


extension String {
    func isEmail() -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}


public struct TextInputFieldsTesting: View {
    //State
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    @State private var street: String = ""
    @State private var number: String = ""
    @State private var postcode: String = ""
    @State private var city: String = ""
    @State private var country: String = ""
    @State private var county: String = ""
    
    public var body: some View {
        Form {
            Section(header: Text("Shipping Address")) {
                TextInputField("First Name", text: $firstName)
                    .autocorrectionDisabled(true)
                TextInputField("Last Name", text: $lastName)
                TextInputField("Email", text: $email, isValid: $isEmailValid)
                    .autocorrectionDisabled(true)
                    .isMandatory()
                    .onValidate { value in
                        value.isEmail()
                        ? .success(true)
                        : .failure(.init(message: "\(value) is not a valid email address"))
                        
                    }
                    .clearButtonHidden(false)
                TextInputField("Street", text: $street)
                TextInputField("Number", text: $number)
                    .keyboardType(.numberPad)
                    .clearButtonHidden(false)
                TextInputField("Post code", text: $postcode)
                TextInputField("City", text: $city)
                TextInputField("County", text: $county)
                TextInputField("Country", text: $country)
                    .clearButtonHidden(false)
            }
        }//Form
        .clearButtonHidden(true)
    }
}


struct TextInputField_Previews: PreviewProvider {
    static var previews: some View {
        //    Group {
        //      TextInputField("First Name", text: .constant("Bowerick Wowbagger the Infinitely Prolonged from outer space"))
        //        .clearButtonHidden()
        //        .previewLayout(.sizeThatFits)
        //      TextInputField("First Name", text: .constant("Peter"))
        //        .preferredColorScheme(.dark)
        //        .previewLayout(.sizeThatFits)
        //    }
        TextInputFieldsTesting()
    }
}

// MARK: - Component Library

struct TextInputField_Library: LibraryContentProvider {
    var views: [LibraryItem] {
        [LibraryItem(TextInputField("First Name", text: .constant("Peter")), title: "TextInputField", category: .control)]
    }
    
    func modifiers(base: TextInputField) -> [LibraryItem] {
        [LibraryItem(base.clearButtonHidden(true), category: .control)]
    }
}

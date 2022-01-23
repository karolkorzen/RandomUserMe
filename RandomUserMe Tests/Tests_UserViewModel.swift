//
//  Tests_UserViewModel.swift
//  RandomUserMe Tests
//
//  Created by Karol Korzeń on 23/01/2022.
//

@testable import RandomUserMe_API
import XCTest

class Tests_UserViewModel: XCTestCase {
    var userViewModel: UserViewModel!
    var userViewModel1: UserViewModel!
    var userViewModel2: UserViewModel!
    
    override func setUp() {
        super.setUp()
        userViewModel = UserViewModel(withUser: User(name: ResponseName(first: nil, last: nil), email: nil, phone: nil, gender: nil, nat: nil, picture: nil, location: nil))
        userViewModel1 = UserViewModel(withUser: User(name: ResponseName(first: "", last: ""), email: "", phone: "", gender: "", nat: "", picture: ResponsePicture(large: "asd"), location: ResponseLocation(coordinates: Coordinates(latitude: "9,4", longitude: "9.6"))))
        userViewModel2 = UserViewModel(withUser: User(name: ResponseName(first: "Mark", last: "Jarek"), email: "asd@gasf.com", phone: "12351", gender: "female", nat: "Romania", picture: ResponsePicture(large: "https://i.ytimg.com/vi/uQp8qbtPZOo"), location: ResponseLocation(coordinates: Coordinates(latitude: "9.4", longitude: "9.6"))))
    }
    
    override func tearDown() {
        userViewModel = nil
        userViewModel1 = nil
        userViewModel2 = nil
        super.tearDown()
    }
    
    func testNameLabelText() throws {
        XCTAssertEqual(self.userViewModel.nameLabelText, " ")
        XCTAssertEqual(self.userViewModel1.nameLabelText, " ")
        XCTAssertEqual(self.userViewModel2.nameLabelText, "Mark Jarek")
    }
    
    func testImageURL() throws {
        XCTAssertEqual(self.userViewModel.imageURL, nil)
        XCTAssertEqual(self.userViewModel1.imageURL?.isFileURL, false)
        XCTAssertEqual(self.userViewModel2.imageURL?.absoluteString, "https://i.ytimg.com/vi/uQp8qbtPZOo")
    }
    
    func testPhoneTitleLabelText() throws {
        XCTAssertEqual(self.userViewModel.phoneTitleLabelText, "phone:")
        XCTAssertEqual(self.userViewModel1.phoneTitleLabelText, "phone:")
        XCTAssertEqual(self.userViewModel2.phoneTitleLabelText, "phone:")
    }
    
    func testGenderTitleLabelText() throws {
        XCTAssertEqual(self.userViewModel.genderTitleLabelText, "gender:")
        XCTAssertEqual(self.userViewModel1.genderTitleLabelText, "gender:")
        XCTAssertEqual(self.userViewModel2.genderTitleLabelText, "gender:")
    }
    
    func testEmailTitleLabelText() throws {
        XCTAssertEqual(self.userViewModel.emailTitleLabelText, "email:")
        XCTAssertEqual(self.userViewModel1.emailTitleLabelText, "email:")
        XCTAssertEqual(self.userViewModel2.emailTitleLabelText, "email:")
    }
    
    func testNationalityTitleLabelText() throws {
        XCTAssertEqual(self.userViewModel.nationalityTitleLabelText, "nationality:")
        XCTAssertEqual(self.userViewModel1.nationalityTitleLabelText, "nationality:")
        XCTAssertEqual(self.userViewModel2.nationalityTitleLabelText, "nationality:")
    }
    
    func testPhoneLabelText() throws {
        XCTAssertEqual(self.userViewModel.phoneLabelText, "")
        XCTAssertEqual(self.userViewModel1.phoneLabelText, "")
        XCTAssertEqual(self.userViewModel2.phoneLabelText, "12351")
    }
    
    func testGenderLabelText() throws {
        XCTAssertEqual(self.userViewModel.genderLabelText, "")
        XCTAssertEqual(self.userViewModel1.genderLabelText, "")
        XCTAssertEqual(self.userViewModel2.genderLabelText, "female")
    }
    
    func testEmailLabelText() throws {
        XCTAssertEqual(self.userViewModel.emailLabelText, "")
        XCTAssertEqual(self.userViewModel1.emailLabelText, "")
        XCTAssertEqual(self.userViewModel2.emailLabelText, "asd@gasf.com")
    }
    
    func testNationalityLabelText() throws {
        XCTAssertEqual(self.userViewModel.nationalityLabelText, "")
        XCTAssertEqual(self.userViewModel1.nationalityLabelText, "")
        XCTAssertEqual(self.userViewModel2.nationalityLabelText, "Romania")
    }
    
    func testGetCoordinates() throws {
        XCTAssertEqual(self.userViewModel.getCoordinates?.0, nil)
        XCTAssertEqual(self.userViewModel.getCoordinates?.1, nil)
        XCTAssertEqual(self.userViewModel1.getCoordinates?.0, nil)
        XCTAssertEqual(self.userViewModel1.getCoordinates?.1, nil)
        XCTAssertEqual(self.userViewModel2.getCoordinates?.0, 9.4)
        XCTAssertEqual(self.userViewModel2.getCoordinates?.1, 9.6)
    }
}

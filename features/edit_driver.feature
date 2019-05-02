Feature: Set driver availability
    As a driver
    So that riders can know whether I am available or not to give rides
    I want to be able to set my driving availability

    Background:
        Given I am logged in
        And I am not a first time driver

    Scenario: Set driver to be available from driver edit page
        Given I am on the home page
        When I follow "I am a Driver"
        Then I should see "Capy Bara"
        When I follow "Edit Driver Details"
        And I check "Currently Available?"
        And I press "Update Driver Info"
        Then I should see "Currently available!"

    Scenario: Set driver to be available from driver show page
        Given I am on the home page
        When I follow "I am a Driver"
        Then I should see "Capy Bara"
        When I follow "Toggle Availability"
        Then I should see "Currently available!"

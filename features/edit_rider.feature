Feature: edit rider information
    As a rider
    So that I can edit my information
    I want to be able to edit my information

    Background:
        Given I am logged in
        And I am not a first time rider


    Scenario: edit rider information
        Given I am on the home page
        When I follow "I am a Rider"
        And I follow "Edit Rider Details"
        Then I should see "Edit Rider Info"
        When I fill in "Ryan" for "First Name"
        And I press "Update Rider Info"
        Then I should be on the riders page
        And I should see "Successfully updated rider"

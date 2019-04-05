Feature: Leave a review
    As a rider
    So that I can let other riders know how good a driver is
    I want to be able to leave reviews for a driver

    Background:
        Given these Drivers:
            | first | last | make | model | plate | seats | available |
            | Jack | Kerning | Jeep | Wrangler | YXY-6969 | 4 | yes |
            | V | Ron | Toyota | Prius | ABC-123 | 13 | no |
            | Ryan | Wetsman | Kia | Sorento | 867-5309 | 100 | yes |
        And I am logged in
        And I am not a first time rider

    Scenario: Leaving a review
        Given I am on the home page
        When I follow "I am a Rider"
        And I follow "Jack Kerning"
        And I follow "Leave a review"
        And I fill in "3" for "How many stars?"
        And I fill in "Literally a Dog!" for "Leave a description"
        And I press "Add Review"
        Then I should see "Literally a Dog!"

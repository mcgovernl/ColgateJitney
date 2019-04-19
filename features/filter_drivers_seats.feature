Feature: Filter by number of seats
    As a rider
    So that I can be sure there are enough seats in the car
    I want to be able to filter drivers by number of seats

    Background:
        Given these Drivers:
            | first | last | make | model | plate | seats | available | price |
            | Jack | Kerning | Jeep | Wrangler | YXY-6969 | 4 | yes | 10 |
            | V | Ron | Toyota | Prius | ABC-123 | 13 | yes | 20 |
            | Ryan | Wetsman | Kia | Sorento | 867-5309 | 100 | yes | 4.50 |
            | Payton | Baker | Tesla | Model 3 | no-gas | 3 | no | 15 |
        And I am logged in
        And I am not a first time rider

    Scenario: set a minimum number of seats
        Given I am on the home page
        When I follow "I am a Rider"
        And I fill in "Minimum seats" with "5"
        And I press "Filter drivers"
        Then I should see "V Ron"
        And I should see "Ryan Wetsman"
        And I should not see "Jack Kerning"
        And I should not see "Payton Baker"

    Scenario: clear filter by number of seats
        Given I am on the home page
        When I follow "I am a Rider"
        And I fill in "Minimum seats" with "5"
        And I press "Filter drivers"
        Then I should see "V Ron"
        And I should see "Ryan Wetsman"
        And I should not see "Jack Kerning"
        And I should not see "Payton Baker"
        When I follow "Clear filters"
        Then I should see "Jack Kerning"
        And I should see "V Ron"
        And I should see "Ryan Wetsman"
        And I should not see "Payton Baker"

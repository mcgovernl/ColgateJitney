Feature: Filter by price
    As a rider
    So that I can make sure that I have enough money for a ride
    I want to filter rides by price

    Background:
        Given these Drivers:
            | first | last | make | model | plate | seats | available | price |
            | Jack | Kerning | Jeep | Wrangler | YXY-6969 | 4 | yes | 10 |
            | V | Ron | Toyota | Prius | ABC-123 | 13 | yes | 20 |
            | Ryan | Wetsman | Kia | Sorento | 867-5309 | 100 | yes | 4.50 |
            | Payton | Baker | Tesla | Model 3 | nogas | 3 | no | 15 |
        And I am logged in
        And I am not a first time rider

    Scenario: set a maximum price
        Given I am on the home page
        When I follow "I am a Rider"
        And I fill in "Maximum price" with "15"
        And I press "Filter drivers"
        Then I should see "Jack Kerning"
        And I should see "Ryan Wetsman"
        And I should not see "V Ron"
        And I should not see "Payton Baker"

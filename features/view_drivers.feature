Feature: view available drivers
    As a rider
    So that I can find a driver
    I want to see a list of available drivers

    Background: the website already has some drivers
        Given these Drivers:
            | first | last | make | model | plate | seats | available |
            | Jack | Kerning | Jeep | Wrangler | YXY-6969 | 4 | yes |
            | V | Ron | Toyota | Prius | ABC-123 | 13 | no |
            | Ryan | Wetsman | Kia | Sorento | 867-5309 | 100 | yes |
        And I am logged in
        And I am not a first time rider

    Scenario: View a list of available drivers
        Given I am on the home page
        When I follow "I am a Rider"
        Then I should see "Jack"
        And I should see "Kerning"
        And I should see "Jeep"
        And I should see "Wrangler"
        And I should see "4"
        And I should see "Ryan"
        And I should see "Wetsman"
        And I should see "Kia"
        And I should see "Sorento"
        And I should see "100"
        And I should not see "V"
        And I should not see "Ron"
        And I should not see "Toyota"
        And I should not see "Prius"
        And I should not see "13"

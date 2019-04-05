Feature: see driver info
    As a rider
    So that I can recognize my driver
    I want to see information about my driver

    Background: the website already has some drivers
        Given these Drivers:
            | first | last | make | model | plate | seats | available |
            | Jack | Kerning | Jeep | Wrangler | YXY-6969 | 4 | yes |
            | V | Ron | Toyota | Prius | ABC-123 | 13 | no |
            | Ryan | Wetsman | Kia | Sorento | 867-5309 | 100 | yes |
        And I am logged in
        And I am not a first time rider

    Scenario: click on a driver and see their information
        Given I am on the home page
        When I follow "I am a Rider"
        And I follow "Jack Kerning"
        Then I should see "Leave a review"

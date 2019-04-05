Feature: see your own reviews
    As a driver
    So that I can see what people think of me as a driver
    I want to be able to see reviews of myself

    Background:
        Given I am logged in
        And I am not a first time driver
        And these Reviews:
            | stars | description | driver_id | rider_id |
            | 4 | Literally a Dog! | 1 | 1 |

    Scenario: see your reviews
        Given I am on the home page
        When I follow "I am a Driver"
        Then I should see "Literally a Dog!"
        And I should see "4"

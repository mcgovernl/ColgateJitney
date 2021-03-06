Feature: see your own reviews
    As a driver
    So that I can see what people think of me as a driver
    I want to be able to see reviews of myself

    Background:
        Given I am logged in
        And I am not a first time driver
        And these Riders:
            | first | last | start | destination | has_ride | user_id |
            | Paytooooon | Baker | 13 Oak Drive | The Old Stone Jug | false | 1 |
        And these Rides:
            | start | destination | done | reviewed | rider_id | driver_id |
            | 13 Oak Drive | The Old Stone Jug | true | false | 1 | 1 |
        And these Reviews:
            | stars | description | driver_id | rider_id | ride_id |
            | 4 | Literally a Dog! | 1 | 1 | 1 |


    Scenario: see your reviews
        Given I am on the home page
        When I follow "I am a Driver"
        Then I should see "Literally a Dog!"
        And I should see "4"

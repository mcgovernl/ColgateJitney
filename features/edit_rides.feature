Feature: end ride
    As a driver
    So that I can declare a ride as being done
    I want to be able to end a ride

    Background:
        Given I am logged in
        And I am not a first time driver
        And these Riders:
            | first | last | start | destination | has_ride | user_id |
            | Paytooooon | Baker | 13 Oak Drive | The Old Stone Jug | false | 1 |
        And these Rides:
            | start | destination | done | reviewed | rider_id | driver_id |
            | 13 Oak Drive | The Old Stone Jug | false | false | 1 | 1 |

    Scenario: end ride
        Given I am on the home page
        When I follow "I am a Driver"
        And I follow "Ride with Paytooooon Baker completed!"
        Then I should see "Successfully completed ride with Paytooooon Baker"

Feature: Login
    As a rider or driver
    So that I can access my account
    I want to be able to log in to a personal account

    Scenario: Sign Up
        Given I am on the home page
        Then I should see "Sign up"
        When I follow "Sign up"
        When I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "capybara"
        And I fill in "Password confirmation" with "capybara"
        And I press "Sign up"
        Then I should see "I am a Driver"
        And I should see "I am a Rider"
        And I should see "Welcome! You have signed up successfully."
        And I should see "Sign out"
        And I should not see "Sign in"

    Scenario: Login with a valid user
        Given I am a valid user
        And I am on the home page
        When I follow "Sign in"
        And I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "capybara"
        And I press "Log in"
        Then I should see "Signed in successfully."
        And I should see "Welcome to Colgate"
        And I should see "I am a Driver"
        And I should see "I am a Rider"
        And I should see "Sign out"

    Scenario: Create Driver
        Given I am logged in
        And I am a new user
        When I follow "I am a Driver"
        Then I should see "Create New Driver"
        When I fill in "First Name" with "Capy"
        And I fill in "Last Name" with "Bara"
        And I fill in "Car Make" with "Capybara"
        And I fill in "Car Model" with "CarMobile"
        And I fill in "License Plate" with "CPYBRA"
        And I fill in "Seats" with "2"
        And I check "Currently Available?"
        And I press "Create New Driver"
        Then I should see "Successfully created driver Capy , Bara"

    Scenario: Fail to create driver
        Given I am logged in
        And I am a new user
        When I follow "I am a Driver"
        Then I should see "Create New Driver"
        When I press "Create New Driver"
        Then I should see "Create New Driver"

    Scenario: Create Rider
        Given I am logged in
        And I am a new user
        And I am on the home page
        When I follow "I am a Rider"
        And I fill in "First Name" with "Capy"
        And I fill in "Last Name" with "Bara"
        And I fill in "Destination" with "Hamilton"
        And I press "Create New Rider"
        Then I should see "Drivers"
        And I should see "Successfully created rider Capy Bara"


    Scenario: Fail to create rider
        Given I am logged in
        When I follow "I am a Rider"
        Then I should see "Create new Rider"
        When I press "Create New Rider"
        Then I should see "Create new Rider"

    Scenario: Trying to sign up with an already used Email
        Given I am a valid user
        And I am on the home page
        When I follow "Sign up"
        And I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "capybara"
        And I fill in "Password confirmation" with "capybara"
        And I press "Sign up"
        Then I should see "Email has already been taken"

    Scenario: Try to login with wrong Password
        Given I am a valid user
        And I am on the home page
        When I follow "Sign in"
        And I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "not_the_correct_password"
        And I press "Log in"
        Then I should see "Invalid Email or password"

    Scenario: Trying to sign up with different passwords
        Given I am on the home page
        Then I should see "Sign up"
        When I follow "Sign up"
        When I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "capybara"
        And I fill in "Password confirmation" with "wrong password"
        And I press "Sign up"
        Then I should see "Password confirmation doesn't match Password"

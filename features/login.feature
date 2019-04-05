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

    Scenario: Login
        Given I am a valid user
        And I am on the home page
        When I follow "Sign in"
        And I fill in "Email" with "capybara@gmail.com"
        And I fill in "Password" with "capybara"
        And I press "Log in"
        Then I should see "Signed in successfully."
        And I should see "Welcome to Colgate Jitney"
        And I should see "I am a Driver"
        And I should see "I am a Rider"
        And I should see "Sign out"

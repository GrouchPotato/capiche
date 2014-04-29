Feature: As a user, In order to know if I should pay tax, I can visit the tax fixture

Scenario: User views the simple yes/no question tax fixture, answering yes to all answers and learns that they should pay taxes
  Given the simple yes/no question tax subject fixture exists
  When I view the subject "Fixture to test simple yes/no questions"
  And I answer yes to "Are you alive?"
  And I answer yes to "Do you have arms?"
  And I answer yes to "Are you a mammal?"
  And I answer yes to "Are you human?"
  Then I can see that I should pay tax

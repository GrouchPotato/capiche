Feature: As a user, In order to know if I should pay tax, I can view the simple yes/no tax fixture

Scenario: User answers in a way which demonstrates that they are a living human and should pay taxes
  Given the simple yes/no question tax subject fixture exists
  When I view the subject "Fixture to test simple yes/no questions"
  And I answer yes to "Are you alive?"
  And I answer no to "Are you a fish?"
  And I answer yes to "Are you a mammal?"
  And I answer yes to "Do you have arms?"
  And I answer yes to "Are you human?"
  Then I can see that I should pay tax

Scenario: User answers in a way which shows that they are infact a fish and shouldn't pay taxes.
  Given the simple yes/no question tax subject fixture exists
  When I view the subject "Fixture to test simple yes/no questions"
  And I answer yes to "Are you alive?"
  And I answer yes to "Are you a fish?"
  Then I should not see the question "Are you a mammal?"
  And I can see that I should not pay taxes

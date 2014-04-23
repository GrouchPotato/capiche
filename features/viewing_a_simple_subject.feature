Feature: As a user, In order to know everything, I can view a simple subject

Scenario: User views a subject
  Given a subject titled "Tax"
  When I view the subject "Tax"
  Then I can see the introduction information for the subject "Tax"

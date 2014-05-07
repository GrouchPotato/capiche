Feature: Admin edits a subject

Scenario: Admin edits a subject
  Given a subject
  When I visit the admin root
  And I click on the subject's title
  And I click on edit
  When I change the slug, title, intro and outcome fields
  And I click on save
  Then I should see that the subject has the new slug, title, intro and outcome

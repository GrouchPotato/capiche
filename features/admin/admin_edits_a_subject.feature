Feature: Admin edits a subject

Scenario: Admin edits a subject
  Given a subject
  When I visit the admin root
  And I click on the subject's title
  And I click on edit
  Then I should see a form for the subject with slug, title and intro fields
  When I change the slug, title and intro fields
  And I click on save
  Then I should see that the subject has the new slug, title and intro

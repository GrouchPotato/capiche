When(/^I click on the subject's title$/) do
  click_on @subject.title
end

When(/^I change the slug, title, intro and outcome fields$/) do
  fill_in "Slug", with: @new_slug = "llama-identification"
  fill_in "Title", with: @new_title = "How to tell a panda from a stick of asparagus"
  fill_in "Intro", with: @new_intro = "Pandas, when seen from a specific angle on a dark night, can look exactly like asparagus. This questionaire will help you tell the difference."
  fill_in "Outcome template", with: @new_outcome = "It's a panda."
end

Then(/^I should see that the subject has the new slug, title, intro and outcome$/) do
  page.should have_content @new_slug
  page.should have_content @new_title
  page.should have_content @new_intro
  page.should have_content @new_outcome
end


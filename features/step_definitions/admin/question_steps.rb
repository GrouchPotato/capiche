When(/^I add a yes\/no question to the subject$/) do
  visit edit_admin_subject_path(@subject)
  click_on "Add question"
  select "Yes/no", from: "Question type"
  fill_in "Key", with: 'likes_blue'
  fill_in "Text", with: @new_question_text = "Do you like blue?"
  click_on "Create"
end

Then(/^I can see that the subject has the new question$/) do
  visit admin_subject_path(@subject)
  page.should have_content(@new_question_text)
end

Given(/^a subject$/) do
  @subject = create(:subject)
end

Given(/^a subject titled "(.*?)"$/) do |title|
  @subject = create(:subject, title: title, intro: "This is the subject intro")
end

When(/^I view the subject "(.*?)"$/) do |title|
  subject = Subject.find_by_title(title)
  visit subject_path(subject)
end

Then(/^I can see the introduction information for the subject "(.*?)"$/) do |title|
  subject = Subject.find_by_title(title)
  page.should have_content subject.title
  page.should have_content subject.intro
end

Given(/^the simple yes\/no question tax subject fixture exists$/) do
  @subject = create(:yes_no_tax_fixture)
end

When(/^I answer yes to "(.*?)"$/) do |question_text|
  question = Question.find_by_text(question_text)
  within(".#{question.key}") do
    choose("Yes")
  end
  click_on "Submit"
end

When(/^I answer no to "(.*?)"$/) do |question_text|
  question = Question.find_by_text(question_text)
  within(".#{question.key}") do
    choose("No")
  end
  click_on "Submit"
end

Then(/^I should not see the question "(.*?)"$/) do |question_text|
  page.should_not have_text question_text
end

Then(/^I can see that I should pay tax$/) do
  page.should have_text "You should pay taxes."
  page.should_not have_text "You should not pay taxes."
end

Then(/^I can see that I should not pay taxes$/) do
  page.should_not have_text "You should pay taxes."
  page.should have_text "You should not pay taxes."
end

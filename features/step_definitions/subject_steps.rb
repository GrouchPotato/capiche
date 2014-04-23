Given(/^a subject titled "(.*?)"$/) do |title|
  create(:subject, title: title)
end

When(/^I view the subject "(.*?)"$/) do |title|
  subject = Subject.find_by_title(title)
  visit subject_path(subject)
end

Then(/^I can see the introduction information for the subject "(.*?)"$/) do |title|
  subject = Subject.find_by_title(title)
  page.should have_content subject.title
end

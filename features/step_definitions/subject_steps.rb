Given(/^a subject$/) do
  @subject = create(:subject)
end

Given(/^a subject titled "(.*?)"$/) do |title|
  @subject = create(:subject, title: title, intro: "This is the subject intro")
end

When(/^I visit the admin root$/) do
  visit admin_root_path
end

When(/^I click on the subject's title$/) do
  click_on @subject.title
end

When(/^I change the title and intro fields$/) do
  fill_in "Title", with: @new_title = "How to tell a panda from a stick of asparagus"
  fill_in "Intro", with: @new_intro = "Pandas, when seen from a specific angle on a dark night, can look exactly like asparagus. This questionaire will help you tell the difference."
end

Then(/^I should see a form for the subject with title and intro fields$/) do
  within "form.subject" do
    page.should have_field("Title", with: @subject.title)
    page.should have_field("Intro", with: @subject.intro)
  end
end

Then(/^I should see that the subject has the new title and intro$/) do
  page.should have_content @new_title
  page.should have_content @new_intro
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

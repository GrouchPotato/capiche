Given(/^a subject$/) do
  @subject = create(:schema_subject)
end

Given(/^a subject titled "(.*?)"$/) do |title|
  @subject = create(:schema_subject, title: title, intro: "This is the subject intro")
end

When(/^I visit the admin root$/) do
  visit admin_root_path
end

When(/^I click on the subject's title$/) do
  click_on @subject.title
end

When(/^I change the slug, title and intro fields$/) do
  fill_in "Slug", with: @new_slug = "llama-identification"
  fill_in "Title", with: @new_title = "How to tell a panda from a stick of asparagus"
  fill_in "Intro", with: @new_intro = "Pandas, when seen from a specific angle on a dar k night, can look exactly like asparagus. This questionaire will help you tell the difference."
end

Then(/^I should see a form for the subject with slug, title and intro fields$/) do
  within "form.subject" do
    page.should have_field("Slug", with: @subject.slug)
    page.should have_field("Title", with: @subject.title)
    page.should have_field("Intro", with: @subject.intro)
  end
end

Then(/^I should see that the subject has the new slug, title and intro$/) do
  page.should have_content @new_slug
  page.should have_content @new_title
  page.should have_content @new_intro
end


When(/^I view the subject "(.*?)"$/) do |title|
  subject = Schema::Subject.find_by_title(title)
  visit subject_path(subject)
end

Then(/^I can see the introduction information for the subject "(.*?)"$/) do |title|
  subject = Schema::Subject.find_by_title(title)
  page.should have_content subject.title
  page.should have_content subject.intro
end

Given(/^the simple yes\/no question tax subject fixture exists$/) do
  @subject = create(:yes_no_tax_fixture)
end

When(/^I answer yes to "(.*?)"$/) do |question_text|
  question = Schema::Question.find_by_text(question_text)
  within(".#{question.key}") do
    select("Yes")
  end
  click_on "Next question"
end

Then(/^I can see that I should pay tax$/) do
  page.should have_text "You should pay taxes."
  page.should_not have_text "You should not pay taxes."
end

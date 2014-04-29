FactoryGirl.define do
  factory :subject do
    sequence(:slug) {|n| "subject-#{n}"}
    sequence(:title) {|n| "Subject title #{n}"}

    factory :yes_no_tax_fixture do
      slug "yes-no-tax-fixture"
      title "Fixture to test simple yes/no questions"
      intro "If you're alive, you should pay tax."
      questions { [
        build(:yes_no_question, text: "Are you alive?", key: "is_alive"),
        build(:yes_no_question, text: "Do you have arms?", key: "has_arms"),
        build(:yes_no_question, text: "Are you a mammal?", key: "is_mammal"),
        build(:yes_no_question, text: "Are you human?", key: "is_human")
      ] }
      outcome "
        {{#is_human}}
          You should pay taxes
        {{/is_human}}
        {{^is_human}}
          You should not pay taxes
        {{/is_human}}
      "
    end
  end
end

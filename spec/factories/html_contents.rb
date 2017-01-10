FactoryGirl.define do
  factory :html_content do
    link 'https://github.com'
  end
  factory :invalid_html_content, parent: :html_content do
    link 'invalid link'
  end
end

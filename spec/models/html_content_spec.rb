require 'rails_helper'

RSpec.describe HtmlContent, type: :model do
  it 'has a valid factory' do
  	FactoryGirl.create(:html_content).should be_valid
  end
  
  it 'is not created with invalid uri formate' do
  	FactoryGirl.build(:html_content, link: nil).should_not be_valid
  end
  
  it 'is not created with invalid uri formate' do
  	FactoryGirl.build(:html_content, link: 'random string').should_not be_valid
  end
  
  it 'is be created with valid uri format' do
  	FactoryGirl.create(:html_content).should be_valid
  end
end

require 'spec_helper'

describe "About page" do
  subject { page }
  before { visit about_path }

  it { should have_content('about') }
  it { should have_selector('title', text: full_title('About')) }

  it "should have some links" do
    click_link "Test link" 
  end
end

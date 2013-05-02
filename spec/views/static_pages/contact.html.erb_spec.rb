require 'spec_helper'


describe "Contact page" do
  subject { page }
  before { visit contact_path }

  it { should have_content('contact') }
end

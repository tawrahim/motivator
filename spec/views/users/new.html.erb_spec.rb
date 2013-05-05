require 'spec_helper'

describe "signup page" do
  subject { page }
  before { visit signup_path }

  it { should have_content('') }
end

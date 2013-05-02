require 'spec_helper'

describe "Help page" do
  subject { page }
  before { visit help_path }

  it { should have_content('help') }
end

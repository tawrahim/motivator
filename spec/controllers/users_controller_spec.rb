require 'spec_helper'

describe UsersController do
  before { @controller = UsersController.new }
  subject { @controller }

  it { should respond_to :new }

end

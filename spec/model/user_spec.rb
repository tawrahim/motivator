require "spec_helper"

describe User do
  before { @user = User.new(name: "Example User", email: "example@me.com",
                            password: "123456", password_confirmation: "123456") }
  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid } 
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid } 
  end

  describe "when username is too long" do
    before { @user.name = "a"*51 }
    it { should_not be_valid } 
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_me.org exam.ys@mf.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end 
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org firs.lsd@me.of a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end 
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
end

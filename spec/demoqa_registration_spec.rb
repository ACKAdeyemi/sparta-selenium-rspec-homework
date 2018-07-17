require 'spec_helper'
require 'faker'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration form page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      @driver.set_first_name_field(Faker::Name.first_name)
      expect(@driver.first_name_field_displayed).to be true
    end

    it 'should accept a last name' do
      @driver.set_last_name_field(Faker::Name.last_name)
      expect(@driver.last_name_field_displayed).to be true
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option('Single')
      # p @driver.single_marital_status # to test selection
      expect(@driver.single_marital_status).to eq true
      expect(@driver.single_marital_status).to_not eq false

      @driver.select_marital_option('Married')
      # p @driver.married_marital_status # to test selection
      expect(@driver.married_marital_status).to eq true
      expect(@driver.married_marital_status).to_not eq false

      @driver.select_marital_option('Divorced')
      # p @driver.divorced_marital_status # to test selection
      expect(@driver.divorced_marital_status).to eq true
      expect(@driver.divorced_marital_status).to_not eq false
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option('Dance')
      # p @driver.dance_hobby_status # to test selection
      expect(@driver.dance_hobby_status).to eq true
      expect(@driver.dance_hobby_status).to_not eq false

      @driver.select_hobby_option('Reading')
      # p @driver.reading_hobby_status # to test selection
      expect(@driver.reading_hobby_status).to eq true
      expect(@driver.reading_hobby_status).to_not eq false

      @driver.select_hobby_option('Cricket')
      # p @driver.cricket_hobby_status # to test selection
      expect(@driver.cricket_hobby_status).to eq true
      expect(@driver.cricket_hobby_status).to_not eq false
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq 'Afghanistan'
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select('United Kingdom')
      expect(@driver.get_selected_country).to eq 'United Kingdom'
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select(3)
      expect(@driver.get_selected_month).to eq '3'

      @driver.dob_day_list_select(5)
      expect(@driver.get_selected_day).to eq '5'

      @driver.dob_year_list_select(1990)
      expect(@driver.get_selected_year).to eq '1990'
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field('07771234567')
      expect(@driver.get_phone_number_field_value.length).to be_a Integer
    end

    it 'should accept a username' do
      @driver.set_user_name_field("#{Faker::Name.male_first_name}151982")
      expect(@driver.get_user_name_field_value).to be_a String
    end

    it 'should accept an email' do
      @driver.set_email_field("#{Faker::Name.female_first_name}#{Faker::Name.male_first_name}10326@test.com")
      expect(@driver.get_email_field_value).to be_a String
    end

    it "should upload a chosen photo" do
      @driver.upload_profile_pic('/Users/tech-a43/Desktop/Sparta/Engineering-11/SDET/web-testing/selenium/selenium-rspec-lab/sample_prof_pic.png')
      expect(@driver.get_pic).to eq "C:\\fakepath\\sample_prof_pic.png"
      # p @driver.get_pic
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field("Hi my name is #{@driver.get_first_name_field_value} #{@driver.get_last_name_field_value} and I love Programming! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
      expect(@driver.get_about_yourself_value).to be_a String
    end

    it 'should accept a password' do
      @driver.set_password_field('iloveCODE1')
      expect(@driver.get_password_value).to be_a String
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field('iloveCODE1')
      expect(@driver.get_confirmation_password_value).to be_a String
      expect(@driver.get_confirmation_password_value).to match(@driver.get_password_value)
    end

    it "should submit the form" do
      @driver.click_submit
    end

    it "should check that the form has been submitted correctly" do
      expect(@driver.check_registration_successful).to eq 'Thank you for your registration'
    end

  end

end

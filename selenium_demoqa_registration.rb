require 'selenium-webdriver'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD = 'name_3_firstname' # id
  LAST_NAME_FIELD = 'name_3_lastname' # id
  MARITAL_STATUS = 'radio_4[]' # id
  HOBBY_STATUS =  'checkbox_5[]' # values
  COUNTRY_DROP_DOWN_LIST = 'dropdown_7' # id
  DOB_MONTH_DROPDOWN_LIST = 'mm_date_8' # id
  DOB_DAY_DROPDOWN_LIST = 'dd_date_8' # id
  DOB_YEAR_DROPDOWN_LIST = 'yy_date_8' # id
  PHONE_NUMBER_FIELDS = 'phone_9' # id
  USERNAME_FIELD = 'username' # id
  EMAIL_FIELD = 'email_1' # id
  PROFILE_PICTURE_BUTTON =  # id
  DESCRIPTION_FIELD = 'description' # id
  PASSWORD_FIELD = 'password_2' # id
  CONFIRM_PASSWORD_FIELD = 'confirm_password_password_2' # id
  SUBMIT_BUTTON = 'pie_submit' # name
  REGISTRATION_CONFIRMATION = 'piereg_message' #class

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field(first_name)
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys(first_name)
    # sleep 1
  end

  def get_first_name_field_value
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD)['value']
  end

  def first_name_field_displayed
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).displayed?
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).send_keys(last_name)
    # sleep 1
  end

  def get_last_name_field_value
    @chrome_driver.find_element(:id, LAST_NAME_FIELD)['value']
  end

  def last_name_field_displayed
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).displayed?
  end

  # Marital option management - Difficulty Medium

  def select_marital_option(marital_status)
    # Consider something like a case statement and check the selenium selected? method
    case marital_status
    when 'Single'
      @chrome_driver.find_elements(:name, MARITAL_STATUS)[0].click
    when 'Married'
      @chrome_driver.find_elements(:name, MARITAL_STATUS)[1].click
    when 'Divorced'
      @chrome_driver.find_elements(:name, MARITAL_STATUS)[2].click
    end
    # sleep 1
  end

  def single_marital_status
    @chrome_driver.find_elements(:name, MARITAL_STATUS)[0].selected?
  end

  def married_marital_status
    @chrome_driver.find_elements(:name, MARITAL_STATUS)[1].selected?
  end

  def divorced_marital_status
    @chrome_driver.find_elements(:name, MARITAL_STATUS)[2].selected?
  end

  # hobby option management - Difficulty Medium

  def select_hobby_option(hobby)
    # Consider something like a case statement and check the selenium selected? method
    case hobby
    when 'Dance'
      @chrome_driver.find_elements(:name, HOBBY_STATUS)[0].click
    when 'Reading'
      @chrome_driver.find_elements(:name, HOBBY_STATUS)[1].click
    when 'Cricket'
      @chrome_driver.find_elements(:name, HOBBY_STATUS)[2].click
    end
    # sleep 1
  end

  def dance_hobby_status
    @chrome_driver.find_elements(:name, HOBBY_STATUS)[0].selected?
  end

  def reading_hobby_status
    @chrome_driver.find_elements(:name, HOBBY_STATUS)[1].selected?
  end

  def cricket_hobby_status
    @chrome_driver.find_elements(:name, HOBBY_STATUS)[2].selected?
  end

  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)['value']
  end

  def country_dropdown_list_select(country)
    @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST).send_keys(country)
    # sleep 1
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def dob_month_list_select(month_value)
    @chrome_driver.find_element(:id, DOB_MONTH_DROPDOWN_LIST).send_keys(month_value)
    # sleep 1
  end

  def get_selected_month
    @chrome_driver.find_element(:id, DOB_MONTH_DROPDOWN_LIST)['value']
  end

  def dob_day_list_select(day_value)
    @chrome_driver.find_element(:id, DOB_DAY_DROPDOWN_LIST).send_keys(day_value)
    # sleep 1
  end

  def get_selected_day
    @chrome_driver.find_element(:id, DOB_DAY_DROPDOWN_LIST)['value']
  end

  def dob_year_list_select(year_value)
    @chrome_driver.find_element(:id, DOB_YEAR_DROPDOWN_LIST).send_keys(year_value)
    # sleep 1
  end

  def get_selected_year
    @chrome_driver.find_element(:id, DOB_YEAR_DROPDOWN_LIST)['value']
  end


  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).send_keys(phone_number)
    # sleep 1
  end

  def get_phone_number_field_value
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS)['value']
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    @chrome_driver.find_element(:id, USERNAME_FIELD).send_keys(user_name)
    # sleep 1
  end

  def get_user_name_field_value
    @chrome_driver.find_element(:id, USERNAME_FIELD)['value']
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)
    @chrome_driver.find_element(:id, EMAIL_FIELD).send_keys(email)
    # sleep 1
  end

  def get_email_field_value
    @chrome_driver.find_element(:id, EMAIL_FIELD)['value']
  end

  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).send_keys(details)
    # sleep 1
  end

  def get_about_yourself_value
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD)['value']
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    @chrome_driver.find_element(:id, PASSWORD_FIELD).send_keys(password)
    # sleep 1
  end

  def get_password_value
    @chrome_driver.find_element(:id, PASSWORD_FIELD)['value']
  end

  def set_confirmation_password_field(password)
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).send_keys(password)
    # sleep 1
  end

  def get_confirmation_password_value
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD)['value']
  end

  # registration confirmation - Difficulty Easy

  def click_submit
    @chrome_driver.find_element(:name, SUBMIT_BUTTON).click
    sleep 6
  end

  def check_registration_successful
    @chrome_driver.find_element(:class, REGISTRATION_CONFIRMATION)['textContent']
  end
end

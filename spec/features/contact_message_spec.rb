require 'rails_helper'

describe "ContactMessages", js: true do
  include PageHelper
  include AdminHelper

  context 'send contact message' do

  	before do
  		visit contact_path
			resize_current_window_to(1920,1080)
  	end

  	scenario 'should be successful' do
      when_i_submit_form_with_all_required_fields
  		then_message_should_be_sent
  	end

  	scenario 'should fail without full name' do
      when_i_submit_form_without_full_name
      then_message_should_not_be_sent
  	end

  	scenario 'should fail without email' do
      when_i_submit_form_without_email
      then_message_should_not_be_sent
  	end

  	scenario 'should fail with invalid email' do
      when_i_submit_form_with_invalid_email
      then_message_should_not_be_sent
  	end

  	scenario 'should fail without message' do
      when_i_submit_form_without_message
      then_message_should_not_be_sent
  	end

    scenario 'should be saved' do
      given_there_are_no_saved_messages
      when_i_submit_form_with_all_required_fields
      then_there_should_be_one_message
    end
  end

  private

  def when_i_submit_form_with_all_required_fields
      fill_in 'contact_message_full_name', with: 'Testing Form'
      fill_in 'contact_message_email', with: 'testing@mail.com'
      fill_in 'contact_message_message', with: 'Some message'
      click_button(t('send'))
  end

  def when_i_submit_form_without_full_name
      fill_in 'contact_message_email', with: 'testing@mail.com'
      fill_in 'contact_message_message', with: 'Some message'
      click_button(t('send'))
  end

  def when_i_submit_form_without_email
      fill_in 'contact_message_full_name', with: 'Testing Form'
      fill_in 'contact_message_message', with: 'Some message'
      click_button(t('send'))
  end

  def when_i_submit_form_with_invalid_email
      fill_in 'contact_message_full_name', with: 'Testing Form'
      fill_in 'contact_message_email', with: 'invalid.email.com'
      fill_in 'contact_message_message', with: 'Some message'
      click_button(t('send'))
  end

  def when_i_submit_form_without_message
      fill_in 'contact_message_full_name', with: 'Testing Form'
      fill_in 'contact_message_email', with: 'testing@mail.com'
      click_button(t('send'))
  end

  def then_message_should_be_sent
      expect(page).to have_content(t('contact_message.was_sent'))
  end

  def then_message_should_not_be_sent
      expect(page).not_to have_content(t('contact_message.was_sent'))
  end

  def given_there_are_no_saved_messages
    ContactMessage.destroy_all
  end

  def then_there_should_be_one_message
    expect(ContactMessage.count).to eq(1)
  end
end

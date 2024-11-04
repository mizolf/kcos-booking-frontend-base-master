module AdminHelper
  def create_admin_and_login(email = 'contact@bamboolab.eu', password = 'password')
    create_admin(email, password)
    login(email, password)
  end

  def create_admin(email = 'contact@bamboolab.eu', password = 'password')
    Admin.create(
      email: email,
      first_name: 'Test',
      last_name: 'Panda',
      admin: true,
      password: password
    )
  end

  def login(email = 'contact@bamboolab.eu', password = 'password')
    visit admin_session_path
    fill_in_login(email, password)
  end

  def fill_in_login(email = 'contact@bamboolab.eu', password = 'password')
    fill_in 'admin_email', with: email
    fill_in 'admin_password', with: password
    click_button(t('devise.shared_links.log_in'))
  end
end
def login(email, username)
  visit '/users/sign_up'
  fill_in 'User name', with: username
  fill_in :Email, with: email
  fill_in 'user[password]', with: 'iamawesome'
  fill_in 'Password confirmation', with: 'iamawesome'
  click_button 'Sign up'
end

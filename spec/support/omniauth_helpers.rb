module OmniauthHelpers
  def auth_data(valid = true)
    OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid:'123545',
        info: {
          email: valid ? 'mail@mail.com' : '',
        },
        extra: {
          raw_info:{
            name: valid ? 'Juan' : '',
          }
        },
        credentials: {
          token: 'some_token',
          expires_at: 1234
        }
      }
    )
  end

  def sign_in_with_facebook(oauth)
    OmniAuth.config.mock_auth[:facebook] = oauth
    click_on "Sign in with Facebook" 
  end
end

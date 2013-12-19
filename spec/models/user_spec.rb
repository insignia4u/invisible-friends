require 'spec_helper'

describe User do

  it { should have_many(:games) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:uid) }
  it { should validate_uniqueness_of(:email) }

  it "creates an user with valid data" do
    data = auth_data(true)
    user = User.from_omniauth data

    expect(user).not_to be_nil
    expect(user.provider).to eq(data.provider)
    expect(user.uid).to eq(data.uid)
    expect(user.name).to eq(data.info.name)
    expect(user.oauth_token).to eq(data.credentials.token)
    expect(user.oauth_expires_at).to eq(Time.at(data.credentials.expires_at))
    expect(User.find_by(uid: data.uid)).not_to be_nil
  end

end

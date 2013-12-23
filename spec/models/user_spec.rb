require 'spec_helper'

describe User do

  describe "Associations" do
    it { should have_many(:games) }
    it { should have_many(:games_where_invited) }

  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "Factory" do
    it "creates a valid user" do
      expect(create(:user)).to be_valid
    end
  end

  describe "#from_omniauth(data)" do
    let(:data) { auth_data }

    context "with a valid omniauth response" do
      it "creates a new user" do
        user = User.from_omniauth(data)

        expect(user).not_to be_nil
        expect(user.provider).to eq(data.provider)
        expect(user.uid).to eq(data.uid)
        expect(user.name).to eq(data.info.name)
        expect(user.oauth_token).to eq(data.credentials.token)
        expect(user.oauth_expires_at).to eq(Time.at(data.credentials.expires_at))
        expect(User.find_by(uid: data.uid)).not_to be_nil
      end
    end

    context "with an invalid omniauth response" do
      it "doesn't create an user" do
        expect{
          User.from_omniauth(auth_data(false))
        }.not_to change{ User.count }.by(1)
      end
    end

    context "with an existing user" do
      it "doesn't duplicate an user" do
        User.from_omniauth(data)

        expect{
          User.from_omniauth(data)
        }.not_to change{ User.count }.by(1)
      end
    end
  end

end

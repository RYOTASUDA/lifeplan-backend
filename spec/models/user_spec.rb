RSpec.describe User do
  describe 'validation' do
    subject { user.valid? }

    context 'name is present' do
      let(:user) { build(:user, name: 'test') }

      it { is_expected.to be true }
    end

    context 'name is blank' do
      let(:user) { build(:user, name: '') }

      it { is_expected.to be false }
    end

    context 'email is valid' do
      let(:user) { build(:user, email: 'test@gmail.com') }

      it { is_expected.to be true }
    end

    context 'email is blank' do
      let(:user) { build(:user, email: nil) }

      it { is_expected.to be false }
    end

    context 'email is not valid format' do
      let(:user) { build(:user, email: 'test') }

      it { is_expected.to be false }
    end

    context 'email is not unique' do
      before { create(:user, email: 'test@gmail.com') }

      let(:user) { build(:user, email: 'test@gmail.com') }

      it { is_expected.to be false }
    end

    context 'email is not case insensitive unique' do
      before { create(:user, email: 'test@gmail.com') }

      let(:user) { build(:user, email: 'TeSt@gmail.com') }

      it { is_expected.to be false }
    end
  end
end

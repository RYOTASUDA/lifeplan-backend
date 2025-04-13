# frozen_string_literal: true

RSpec.describe User do
  describe 'validation' do
    subject { user.valid? }

    context 'when name is present' do
      let(:user) { build(:user, name: 'test') }

      it { is_expected.to be true }
    end

    context 'when name is blank' do
      let(:user) { build(:user, name: '') }

      it { is_expected.to be false }
    end

    context 'when email is valid' do
      let(:user) { build(:user, email: 'test@gmail.com') }

      it { is_expected.to be true }
    end

    context 'when email is blank' do
      let(:user) { build(:user, email: nil) }

      it { is_expected.to be false }
    end

    context 'when email is not unique' do
      before { create(:user, email: 'test@gmail.com') }

      let(:user) { build(:user, email: 'test@gmail.com') }

      it { is_expected.to be false }
    end

    context 'when email is not case sensitive unique' do
      before { create(:user, email: 'test@gmail.com') }

      let(:user) { build(:user, email: 'TeSt@gmail.com') }

      it { is_expected.to be false }
    end
  end
end

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'factory' do
    subject { build(:article) }

    it { is_expected.to be_valid }
  end

  describe 'validations' do
    subject { build(:article) }

    it { is_expected.to validate_presence_of(:title)  }
    it { is_expected.to validate_presence_of(:content)  }
    it { is_expected.to validate_presence_of(:slug)  }
    it { is_expected.to validate_uniqueness_of(:slug)  }
  end

  describe 'scopes' do
    describe '.recent' do
      let!(:other_article) { create(:article, created_at: 1.hour.ago) }
      let!(:article) { create(:article, created_at: 2.hour.ago, slug: 'slug') }

      it 'returns articles in the correct order' do
        expect(described_class.recent).to eq([other_article, article])
      end
    end
  end
end

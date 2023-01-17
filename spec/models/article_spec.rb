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
end

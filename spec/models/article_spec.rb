require 'rails_helper'

RSpec.describe Article, :type => :model do
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_least(3) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:body).is_at_least(13) }

  describe 'creation' do
    context 'Valid attributes' do
      it 'should be valid' do
        article = FactoryGirl.build(:article)
        expect(article).to be_valid
      end
    end
    
    context 'invalid attributes' do
      it 'should not be valid' do
        article = FactoryGirl.build(:article, :title => '')
        expect(article).not_to be_valid
      end
    end
  end
end

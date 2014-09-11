require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should ensure_length_of(:body).is_at_least(13) }

  describe 'creation' do
    context 'Valid attributes' do
      it 'should be valid' do
        comment = FactoryGirl.build(:comment)
        expect(comment).to be_valid
      end
    end
    
    context 'invalid attributes' do
      it 'should not be valid' do
        comment = FactoryGirl.build(:comment, :body => '')
        expect(comment).not_to be_valid
      end
    end
  end
end

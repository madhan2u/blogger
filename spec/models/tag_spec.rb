require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it { should ensure_length_of(:name).is_at_least(3) }

  describe 'creation' do
    context 'Valid attributes' do
      it 'should be valid' do
        tag = FactoryGirl.build(:tag)
        expect(tag).to be_valid
      end
    end
    
    context 'invalid attributes' do
      it 'should not be valid' do
        tag = FactoryGirl.build(:tag, :name => '')
        expect(tag).not_to be_valid
      end
    end
  end
end

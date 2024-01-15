require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      message = build(:message)
      expect(message).to be_valid
    end

    it 'is not valid without a description' do
      message = build(:message, description: nil)
      expect(message).not_to be_valid
      expect(message.errors[:description]).to be_present
    end

    it 'is not valid without a person_name' do
      message = build(:message, person_name: nil)
      expect(message).not_to be_valid
      expect(message.errors[:person_name]).to be_present
    end

    it 'is not valid without a person_mail' do
      message = build(:message, person_mail: nil)
      expect(message).not_to be_valid
      expect(message.errors[:person_mail]).to be_present
    end
  end
end

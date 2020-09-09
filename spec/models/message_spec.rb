require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ投稿' do
    before do
      @message = FactoryBot.build(:message)
    end
    it "contentがあれば投稿できる" do
      expect(@message).to be_valid
    end
    it "contentがないと投稿できない" do
      @message.content = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
    it "contentが201文字以上だと投稿できない" do
      @message.content = 'あ' * 201
      @message.valid?
      expect(@message.errors.full_messages).to include("Content is too long (maximum is 200 characters)")
    end
  end
end

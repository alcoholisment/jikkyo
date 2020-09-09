require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '新規ルーム作成' do
    before do
      @room = FactoryBot.build(:room)
    end
    it "nameがあれば作成できる" do
      expect(@room).to be_valid
    end
    it "nameが空だと作成できない" do
      @room.name = nil
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
    it "nameが41文字以上だと作成できない" do
      @room.name = 'あ' * 41
      @room.valid?
      expect(@room.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
  end
end

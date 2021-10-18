require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'お問い合わせルーム作成' do
    context '新規作成できる場合' do
      it "件名の値が存在し、companyが紐づいていれば作成できる" do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "件名が空では作成できない" do
        @room.title = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Title can't be blank")
      end
      it 'companyが紐づいていないと作成できない' do
        @room.company = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('Company must exist')
      end
    end
  end

end

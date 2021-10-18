require 'rails_helper'

RSpec.describe Iquiry, type: :model do
  before do
    @iquiry = FactoryBot.build(:iquiry)
  end

  describe '問い合わせの投稿' do
    context 'メッセージが投稿できる場合' do
      it 'messageとimageが存在していれば保存できる' do
        expect(@iquiry).to be_valid
      end
      it 'messageが空でも保存できる' do
        @iquiry.message = ''
        expect(@iquiry).to be_valid
      end
      it 'imageが空でも保存できる' do
        @iquiry.image = nil
        expect(@iquiry).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'messageとimageが空では保存できない' do
        @iquiry.message = ''
        @iquiry.image = nil
        @iquiry.valid?
        expect(@iquiry.errors.full_messages).to include("Message can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @iquiry.room = nil
        @iquiry.valid?
        expect(@iquiry.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @iquiry.user = nil
        @iquiry.valid?
        expect(@iquiry.errors.full_messages).to include('User must exist')
      end
    end
  end

end

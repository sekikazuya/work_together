require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.build(:company)
  end

  describe '会社の登録' do
    context '会社が登録できる場合' do
      it '会社画像、会社名、会社名(カナ)、業種、最も得意なプロダクト、会社PR、都道府県、市区町村・番地、建物名、電話番号、受付時間が存在すれば出品できる' do
        expect(@company).to be_valid
      end
      it '建物名が空でも登録できる' do
        @company.building_name = ''
        expect(@company).to be_valid
      end
      it '受付時間が空でも登録できる' do
        @company.business_hours = ''
        expect(@company).to be_valid
      end
    end
    context '会社が登録できない場合' do
      it '会社画像が空では登録できない' do
        @company.image = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Image can't be blank")
      end
      it '会社名が空では登録できない' do
        @company.name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Name can't be blank")
      end
      it '会社名(カナ)が空では登録できない' do
        @company.name_kana = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Name kana can't be blank")
      end
      it '会社名(カナ)が英字では登録できない' do
        @company.name_kana = 'aiu'
        @company.valid?
        expect(@company.errors.full_messages).to include('Name kana is invalid')
      end
      it '会社名(カナ)が数字では登録できない' do
        @company.name_kana = '123'
        @company.valid?
        expect(@company.errors.full_messages).to include('Name kana is invalid')
      end
      it '会社名(カナ)がひらがなでは登録できない' do
        @company.name_kana = 'あいう'
        @company.valid?
        expect(@company.errors.full_messages).to include('Name kana is invalid')
      end
      it '会社名(カナ)が漢字では登録できない' do
        @company.name_kana = '亜伊宇'
        @company.valid?
        expect(@company.errors.full_messages).to include('Name kana is invalid')
      end
      it '業種が空では登録できない' do
        @company.sector_id = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Sector プルダウンより選択してください")
      end
      it '業種の情報が初期値のままでは登録できない' do
        @company.sector_id = '0'
        @company.valid?
        expect(@company.errors.full_messages).to include("Sector プルダウンより選択してください")
      end
      it '最も得意なプロダクトが空では登録できない' do
        @company.industry_id = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Industry プルダウンより選択してください")
      end
      it '最も得意なプロダクトの情報が初期値のままでは登録できない' do
        @company.industry_id = '0'
        @company.valid?
        expect(@company.errors.full_messages).to include("Industry プルダウンより選択してください")
      end
      it '会社PRが空では登録できない' do
        @company.profile = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Profile can't be blank")
      end
      it '都道府県が空では登録できない' do
        @company.prefecture_id = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Prefecture プルダウンより選択してください")
      end
      it '都道府県の情報が初期値のままでは登録できない' do
        @company.prefecture_id = '0'
        @company.valid?
        expect(@company.errors.full_messages).to include("Prefecture プルダウンより選択してください")
      end
      it '市区町村・番地が空では登録できない' do
        @company.city = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空では登録できない' do
        @company.phone = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁以下では登録できない' do
        @company.phone = '012345678'
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が12桁以上では登録できない' do
        @company.phone = '012345678910'
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号がに数字以外が混じっていると登録できない' do
        @company.phone = '0123456789a'
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐づいていないと出品できない' do
        @company.user = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('User must exist')
      end
    end
  end
end


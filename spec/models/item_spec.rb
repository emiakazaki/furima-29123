require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品登録' do

  before do
    @item = FactoryBot.build(:item)
  end

context '出品できる時' do

  it "全ての項目が存在すれば登録できる" do
    expect(@item).to be_valid
    end

  context '出品ができない時' do

  it "imageが空では登録できないこと" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "product_nameが空では登録できないこと" do
    @item.product_name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Product name can't be blank")
  end

  it "textが空では登録できないこと" do
    @item.text = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it "priceが空では登録できないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "category_idが選択されてないと登録できないこと" do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 0")
  end

  it "state_idが空では登録できないこと" do
    @item.state_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("State must be other than 0")
  end

  it "fee_idが空では登録できないこと" do
    @item.fee_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Fee must be other than 0")
  end

  it "prefecture_idが空では登録できないこと" do
    @item.prefecture_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
  end

  it "scheduled_delivery_idが空では登録できないこと" do
    @item.scheduled_delivery_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
  end
  it 'priceが全角数字だと保存できないこと' do
    @item.price = "２０００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end

  it 'priceが300円未満では保存できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it 'priceが9,999,999円を超過すると保存できないこと' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end

  it 'priceが半角英数字混合では出品できないこと' do
    @item.price = "2ppp0"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end

  it 'priceが半角英字のみでは出品できないこと' do
    @item.price = "aaaaaa"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
end
end
end
end
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do

  before do
    @userorder = FactoryBot.build(:user_order)
  end

context '商品の購入ができる時' do

  it "全ての項目が存在すれば購入できる" do
    expect(@userorder).to be_valid
  end

context '商品の購入ができない時' do

  it "tokenが空では購入できないこと" do
    @userorder.token = nil
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Token can't be blank")
  end

  it "postal_codeが空では購入できないこと" do
    @userorder.postal_code = nil
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Postal code can't be blank")
  end

  it "municipalityが空では購入できないこと" do
    @userorder.municipality = nil
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Municipality can't be blank")
  end

  it "addressが空では購入できないこと" do
    @userorder.address = nil
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Address can't be blank")
  end

  it "telが空では購入できないこと" do
    @userorder.tel = nil
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Tel can't be blank")
  end

  it "prefecture_idが選択されてないと購入できないこと" do
    @userorder.prefecture_id = 0
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Prefecture must be other than 0")
  end

  it "postal_codeが半角英数字混合では購入できないこと" do
    @userorder.postal_code = "2ppp0"
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Postal code is invalid")
  end

  it "postal_codeが半角英字のみでは購入できないこと" do
    @userorder.postal_code = "aaaaaa"
    @userorder.valid?
    expect(@userorder.errors.full_messages).to include("Postal code is invalid")
  end

end
end
end
end



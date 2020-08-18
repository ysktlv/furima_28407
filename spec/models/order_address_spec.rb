require "rails_helper"

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe "商品購入" do
    context "商品が購入できるとき" do
      it "すべての項目が存在すれば購入できる" do
        expect(@order).to be_valid
      end
    end
    context "商品が購入できないとき" do
      it "郵便番号がないと購入できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "都道府県がないと購入できない" do
        @order.prefecture = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end
      it "市区町村がないと購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地がないと購入できない" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号がないと購入できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @order.postal_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号はハイフンを含めてください")
      end
      it "電話番号にハイフンがあると登録できない" do
        @order.phone_number = "090-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号はハイフンを含まない11桁以内で入力してください")
      end
      it "電話番号が12桁以上だと購入できない" do
        @order.phone_number = "090-1234-56789"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号はハイフンを含まない11桁以内で入力してください")
      end
    end
  end
end

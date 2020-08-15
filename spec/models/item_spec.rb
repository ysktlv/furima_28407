require "rails_helper"

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/test_image.jpeg")
  end

  describe "商品出品" do
    context "商品が出品できるとき" do
      it "すべての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できないとき" do
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it "商品名がないと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品の説明がないと登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリーの情報がないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "商品の状態についての情報がないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "配送料の負担についての情報がないと登録できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "発送元の地域についての情報が登録できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end
      it "発送までの日数についての情報がないと登録できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "価格についての情報がないと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "価格が300円以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300~9,999,999円の範囲で設定してください")
      end
      it "価格が9,999,999円以上だと登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300~9,999,999円の範囲で設定してください")
      end
    end
  end
end

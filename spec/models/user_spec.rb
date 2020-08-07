require "rails_helper"

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができるとき" do
      it "すべての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録ができないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = "sample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it "last_nameが全角でないと登録できない" do
        @user.last_name = "last_name"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前は全角文字を使用してください")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "first_name"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前は全角文字を使用してください")
      end
      it "last_name_readingが空だと登録できない" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)を入力してください")
      end
      it "first_name_readingが空だと登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)を入力してください")
      end
      it "last_name_readingが全角カタカナでないと登録できない" do
        @user.last_name_reading = "名字"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)は全角カナを使用してください")
      end
      it "first_name_readingが全角カタカナでないと登録できない" do
        @user.first_name_reading = "名字"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)は全角カナを使用してください")
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end

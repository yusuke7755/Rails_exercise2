class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]

  #一覧画面
  def index
    @contacts = Contact.all
  end

  #新規作成
  def new
      # 追記する
      @contact = Contact.new
  end

  # 編集
  def edit
  end

  #登録処理
  def create
    #変数に値を入れる
    @contact = Contact.new(contact_params)

    # 戻るで処理を変更
    if params[:back]
      render :new
    else
      if @contact.save
        #データが正しく入力されれば保存。
        redirect_to contacts_path, notice: "ブログを作成しました！"
      else
        #データにエラーが生じている場合。画面をそのまま返す。
        render :new
      end
    end
  end

  #更新処理
  def update
    if params[:back]
      render :edit
    # 更新
    elsif @contact.update(contact_params)
      redirect_to contacts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  #削除処理
  def destroy
    @contact.destroy
    redirect_to contacts_path, notice:"ブログを削除しました！"
  end

  #確認画面
  def confirm
    @contact = Contact.new(contact_params)
    #@contact.id = params[:id]
    #render :new if @contact.invalid?
  end

  private
  # Strong Parameters で　許可する項目の設定
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  # idをキーとして値を取得するメソッドを追加
  def set_contact
    @contact = Contact.find(params[:id])
  end
end

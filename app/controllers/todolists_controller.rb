class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # ストロングパラメーターを使用
    list = List.new(list_params)
    # DBへ保存する
    list.save
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
     @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ（レコードを1件取得）
    list.destroy #データ（レコード）を削除
    redirect_to todolists_path #List一覧画面へリダイレクト
  end

  private

  def list_params
    # paramsにlistという項目があり、その中にtitle,body,imageという項目が用意されている
    params.require(:list).permit(:title,:body,:image)
  end

end
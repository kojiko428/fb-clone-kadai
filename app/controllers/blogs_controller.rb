class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]

     def index
      @blogs = Blog.all
      # binding.pry # raise
     end
     def new
      @blog =Blog.new
     end
     # 追記する
     def create
       @blog = current_user.blogs.build(blog_params)
       # @blog=Blog.create(blog_params)
       # @blog.user_id = current_user.id
       if params[:back]
        render :new
      elsif @blog.save
       # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
        redirect_to new_blog_path , notice: "#{@blog.user.name}さんがブログを作成しました！"
       else
       # 入力フォームを再描画します。
        render :new
        end
     end

    def show
      # @blog = Blog.find(params[:id])
      # お気に入り機能
       @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    end

    def edit
      # @blog = Blog.find(params[:id])
    end
    def update
      # @blog = Blog.find(params[:id])

      if @blog.update(blog_params)
        redirect_to blogs_path , notice: "#{@blog.user.name}さんがブログを編集しました！"
      else
        render :edit
      end
    end



     def destroy
       @blog.destroy
       redirect_to blogs_path, notice:"#{@blog.user.name}さんがブログを削除しました！"
     end

     def confirm
         @blog = current_user.blogs.build(blog_params)
         # @blog = Blog.new(blog_params)
         # @blog.user_id = current_user.id
         render :new if @blog.invalid?
       end


    private
    def blog_params
      params.require(:blog).permit(:title, :content, :image, :image_cache)
    end
    def set_blog
    @blog = Blog.find(params[:id])
    end


end

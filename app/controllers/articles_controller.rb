class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :show, :destroy, :update]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 10)
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:succes] = "Nouvelle article créé"
            redirect_to article_path(@article)
        else 
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            flash[:succes] = "Article mis à jour"
            redirect_to article_path(@article)
        else 
            render 'edit', status: :unprocessable_entity        
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article supprimé"
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user
            flash[:danger] = "Eh mais tu fais quoi toi lo ?"
            redirect_to blog_path
        end
    end

end
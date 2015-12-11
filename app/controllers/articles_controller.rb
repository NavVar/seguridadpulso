class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy,:authorize, :deauthorize]

  # GET /articles
  # GET /articles.json
  def index
    if params[:search]
      @articles = Article.search(params[:search]).where(confirmed:true).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
      
    else
      @articles = Article.where(confirmed:true).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end
  end

  def suggested
    if params[:search]
      @articles = Article.search(params[:search]).where(suggested:true).order("created_at DESC")
    else
      @articles = Article.where(suggested:true).order("created_at DESC")
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
     @comment = Comment.new
     @comments=Comment.all
  end
  def home
  end

  # GET /articles/new
  def new
    @article = Article.new


  end
  def deauthorize
     @article.confirmed=false
     respond_to do |format|
       if @article.save
         format.html { redirect_to '/articles/suggested', notice: 'Artículo editado con éxito' }
         format.json { render :show, status: :ok, location: @article }
       else
         format.html { render :edit }
         format.json { render json: @article.errors, status: :unprocessable_entity }
       end
     end
  end
  def authorize
     @article.confirmed=true
     respond_to do |format|
       if @article.save
         format.html { redirect_to '/articles/suggested', notice: 'Artículo editado con éxito' }
         format.json { render :show, status: :ok, location: @article }
       else
         format.html { render :edit }
         format.json { render json: @article.errors, status: :unprocessable_entity }
       end
     end
  end
  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if current_user.has_role? :admin
      @article.confirmed=true
    else
      @article.confirmed=false
    end
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Artículo creado con éxito' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Artículo editado con éxito' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artículo borrado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :author, :description, :confirmed, :suggested, :topic_id)
    end
end

class AuthorsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.is_valid?
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @author.update(author_params)
    if @author.is_valid?
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_post!
    @author = Author.find(params[:id])
  end
end

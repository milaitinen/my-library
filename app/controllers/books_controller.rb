class BooksController < ApplicationController
  def index
    if params[:key_word]
      @books = Book.where('title LIKE ?', "%#{params[:key_word]}%")
    else
      @books = Book.all
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.volume = 1 if params[:volume].nil?
    @book.comments = '-' if params[:comments].nil?

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
   
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :volume, :author, :genre, :published_year, :comments)
    end
end
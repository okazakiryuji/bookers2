class BooksController < ApplicationController
  def new
  end

  def index
    @Book = Book.new
    @books = Book.all

  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to '/books'
  end

  def book_params
    params.require(:book).permit(:title, :body,:image)
  end
end

class BooksController < ApplicationController
  def new
  end

  def index
    @Book = Book.new
  end

  def create
    book = book.new(book_params)
    book.save
    redirect_to '/books'
  end
end

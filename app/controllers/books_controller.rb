class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.new book_params
    book.save
    # Book.create book_params

    if book.save
      render json: book.to_json, status: 200
    else
      render json: { message: 'Shit happens' }, status: 422
    end

    # respond_with book
  end



  def update
    book = Book.find params[:id]

    book.attributes = book_params
    book.save

    if book.save
      render json: book.to_json, status: 200
    else
      render json: { message: book.errors }, status: 422
    end
    # book.update_attributes book_params
  end

  def bind_driver
  end

  private

  def book_params
    params.permit(:author, :pages, :title)
  end
end

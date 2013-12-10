class BooksController < ApplicationController
	before_action :admin_user, only: [:create, :destroy, :edit, :update]

	def index
		@books = Book.all
		@new_book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = "book added"
			redirect_to books_path
		else
			render 'index'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update_attributes(book_params)
			flash[:success] = "book updated"
			redirect_to books_path
		else
			render 'edit'
		end
	end

	def destroy
		Book.find(params[:id]).destroy
		flash[:success] = "book deleted"
		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:title, :author, :review, :completed)
		end
end

class ReviewsController < ApplicationController
	def create
		package = Package.find(params[:package_id])
		review = current_user.reviews.new(review_params)
		review.package_id = package.id
		review.save
		redirect_to package_path(package)
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		package = Package.find(params[:package_id])
		@review.update(review_params)
		redirect_to admin_package_path(package.id)
	end

	def destroy
		review = Review.find(params[:id])
		package = Package.find(params[:package_id])
		review.destroy
		if admin_signed_in?
			redirect_to admin_package_path(package.id)
		else
			redirect_to package_path(package.id)
		end
	end

	private
	def review_params
		params.require(:review).permit(:comment)
	end
end

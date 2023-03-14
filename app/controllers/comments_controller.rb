class CommentsController < ApplicationController
	def create
		@activity = Activity.find(params[:activity_id])
		@comment = @activity.comments.create(comment_params)
		redirect_to activity_path(@activity)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@activity = @comment.activity
		@comment.destroy

		redirect_to activity_path(@activity)

	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end

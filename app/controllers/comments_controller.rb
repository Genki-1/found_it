class CommentsController < ApplicationController
  def create
  	@recipe = Recipe.find(params[:recipe_id])
	comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = @recipe.id
    if comment.save
      redirect_to recipe_path(@recipe)
    else
      @comments = Comment.where(recipe_id: @recipe.id)
      render "recipes/show"
    end
  end

  def destroy
  	@recipe = Recipe.find(params[:recipe_id])
	comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.recipe_id = @recipe.id
    if comment.save
      redirect_to recipe_path(@recipe)
    else
     render "recipes/show"
    end
  end

	private
	  def comment_params
	  	params.require(:comment).permit(:comment)
	  end
end

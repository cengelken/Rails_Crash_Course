class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        
        if @comment.save
            redirect_to @post, notice: 'Comment was successfully created.'
        else
            redirect_to @post, alert: 'Error creating comment. ' +
                    @comment.errors.full_messages.to_sentence
        end
    end
    
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @post.comments.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
    def comment_params
        params.require(:comment).permit(:author, :body, :email)
    end
end
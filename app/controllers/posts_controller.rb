
class PostsController < ApplicationController
  acts_as_token_authentication_handler_for User

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      render :json => @post, :status => :created
    else
      render :json => { :errors => @post.errors.full_messages },
             :status => :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      head :no_content
    else
      render :json => { :errors => @post.errors.full_messages },
             :status => :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    head :no_content
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :weekly_theme_id, :link)
    end
end

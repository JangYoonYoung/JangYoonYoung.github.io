class HomeController < ApplicationController
  
  def create
    @post = Post.new #테이블의 한 빈 한 행을 추가
    @post.title = params[:post_title] #post_title이라는 이름의 내용을 title행에 저장
    @post.content = params[:post_content] #post_content라는 이름의 내용을 content 행에 저장
    @post.date = params[:post_date]
    @post.save #테이블에 써준 내용을 모두 저장 , .save 이후 id가 부여됨
    redirect_to '/home/list' #이 과정이 끝나면 home의 index로 돌아가겠다.
  end
  
  def new
  end
  
  def list
    @posts = Post.all #작성된 테이블 전체 보기
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    # 입력받을 데이터를 실제 DB에 저장할 액션. 실제 처리를 한다. 
        @post = Post.find(params[:post_id])
        # 수정할 코드
        @post.title = params[:post_title]
        @post.content = params[:post_content]
        @post.date = params[:post_date]
        @post.save
        redirect_to "/home/list"
  end
  
  def delete
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to '/home/list'
  end
  
end

class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    if @board.save
      redirect_to new_board_path, notice: "投稿完了しました"
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to boards_path, notice: "編集完了しました"
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path, notice:"削除しました！"
  end

  private

  def board_params
    params.require(:board).permit(:author_name, :title, :body)
  end


end

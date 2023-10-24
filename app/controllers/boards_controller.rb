class BoardsController < ApplicationController
  def index
    @boards = Board.all
    binding.pry

  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if params[:back]
      render :new
    else
      if @board.save
        redirect_to boards_path, notice: "投稿完了しました"
      else
        render :new
      end
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

  def confirm
    @board = Board.new(board_params)
    render :new if @board.invalid?
  end


  private

  def board_params
    params.require(:board).permit(:author_name, :title, :body)
  end


end

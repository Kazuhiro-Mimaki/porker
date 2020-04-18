class PorkersController < ApplicationController

  def show
    @porker = Porker.find(params[:id])
    @suit = @porker.text.scan(/[SHDC]/).sort
    @number = @porker.text.scan(/\d+/).sort

    if @number[0] == @number[3] || @number[1] == @number[4]
      flash.now[:a] = 'フォー・オブ・ア・カインド'
    elsif @number[0] == @number[2] && @number[3] == @number[4] && @number[0] != @number[3] || @number[0] == @number[1] && @number[2] == @number[4] && @number[0] != @number[2]
      flash.now[:b] = 'フルハウス'
    elsif @number[0] == @number[1] && @number[2] == @number[3] || @number[1] == @number[2] && @number[3] == @number[4]
      flash.now[:c] = 'ツーペア'
    elsif @number[0] == @number[2] || @number[1] == @number[3] || @number[2] == @number[4]
      flash.now[:d] = 'スリー・オブ・ア・カインド'
    elsif @number[0] == @number[1] || @number[1] == @number[2] || @number[2] == @number[3] || @number[3] == @number[4]
      flash.now[:e] = 'ワンペア'
    else
      flash.now[:f] = 'ハイカード'
    end

    if @suit[0] == @suit[4]
      flash.now[:g] = 'フラッシュ'
    end
  end

  def new
    @porker = Porker.new
  end

  def create
    @porker = Porker.new(porker_params)

    if @porker.save
      redirect_to @porker
    else
      render 'new'
    end
  end


  private
    def porker_params
      params.require(:porker).permit(:text)
    end

end

class FoosController < ApplicationController
  before_action :set_foo, only: %i[ show update destroy ]
  def index
    @q = Foo.ransack(params[:q])
    @foos = @q.result.page(params[:page])
  end

  def new
    @foo = Foo.new
  end

  def create
    @foo = Foo.new(foo_params)

    if @foo.save
      redirect_to @foo, notice: "Foo was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def update
    if @foo.update(foo_params)
      redirect_to @foo, notice: "Foo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @foo.destroy
    redirect_to foos_url, notice: "Foo was successfully destroyed."
  end

  def dropdown
    @foos = Foo.ransack({ name_cont: params[:search] }).result.page(params[:page])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_foo
    @foo = Foo.find(params[:id])
  end

  def foo_params
    params.require(:foo).permit(:name, :time, :checked, :price, :status)
  end
end

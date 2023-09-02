class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[start show edit update destroy update_inline]
  before_action :test_params, only: %i[create update update_inline]

  def index
    
  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit
    
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      flash[:notice] = t('controllers.admin.tests.created', test_title: @test.title)
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    flash[:notice] = t('controllers.admin.tests.deleted', test_title: @test.title)
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)

    redirect_to test_passage_path(current_user.test_passage(@test))
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :active)
  end

end
